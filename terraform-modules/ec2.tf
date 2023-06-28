resource "aws_instance" "swarm" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "vacation-vibe"
  subnet_id                   = aws_subnet.swarm-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.swarm-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("github-server.sh")
  tags = {
    Name = "master-node1"
  }
}

resource "aws_instance" "swarm" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "vacation-vibe"
  subnet_id                   = aws_subnet.swarm-subnet-2.id
  vpc_security_group_ids      = [aws_security_group.swarm-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("github-server.sh")
  tags = {
    Name = "master-node2"
  }
}

resource "aws_instance" "swarm" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "vacation-vibe"
  subnet_id                   = aws_subnet.swarm-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.swarm-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("github-server.sh")
  tags = {
    Name = "master-node3"
  }
}
resource "aws_instance" "swarm" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "vacation-vibe"
  subnet_id                   = aws_subnet.swarm-subnet-2.id
  vpc_security_group_ids      = [aws_security_group.swarm-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("github-server.sh")
  tags = {
    Name = "worker-node1"
  }
}

resource "aws_instance" "swarm" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "vacation-vibe"
  subnet_id                   = aws_subnet.swarm-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.swarm-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("github-server.sh")
  tags = {
    Name = "worker-node2"
  }
}