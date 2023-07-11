resource "aws_vpc" "swarm-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "swarm-subnet-1" {
  vpc_id            = aws_vpc.swarm-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name = "${var.env_prefix}-subnet-1"
  }
}
resource "aws_subnet" "swarm-subnet-2" {
  vpc_id            = aws_vpc.swarm-vpc.id
  cidr_block        = var.subnet_cidr_block-2
  availability_zone = var.avail_zone-2
  tags = {
    Name = "${var.env_prefix}-subnet-2"
  }
}

resource "aws_internet_gateway" "swarm-igw" {
  vpc_id = aws_vpc.swarm-vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

resource "tls_private_key" "rsa_4096"{
  algorithm =  "RSA"
  rsa_bits  =  4096
}

resource "aws_key_pair" "key_pair" {
  key_name = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "local_file" "private_key" {
  content = tls_private_key.rsa_4096.private_key_pem
  filename = var.key_name
}

resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.swarm-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.swarm-igw.id
  }
  tags = {
    Name = "${var.env_prefix}-main-rtb"
  }
}

resource "aws_security_group" "swarm-sg" {
  vpc_id = aws_vpc.swarm-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env_prefix}-sg"
  }
}