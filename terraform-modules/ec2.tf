resource "aws_instance" "swarm" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.swarm-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.swarm-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("github-server.sh")
  count =                       5
  tags = {
    Name = var.swarm_name[count.index]
  }
}

