resource "aws_route53_zone" "swarm-zone" {
  name = "vacationvibe.com.ng"
  vpc {
    vpc_id = aws_vpc.swarm-vpc.id
  }

}