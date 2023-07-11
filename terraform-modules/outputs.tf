output "ec2_public_ip-0" {
  value = aws_instance.swarm[0].public_ip
}
output "ec2_public_ip-1" {
  value = aws_instance.swarm[1].public_ip
}
output "ec2_public_ip-2" {
  value = aws_instance.swarm[2].public_ip
}
output "ec2_public_ip-3" {
  value = aws_instance.swarm[3].public_ip
}
output "ec2_public_ip-4" {
  value = aws_instance.swarm[4].public_ip
}