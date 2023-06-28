resource "aws_route53_zone" "swarm-zone" {
  name = "vacation-vibe.com.ng"
  vpc {
    vpc_id = aws_vpc.swarm-vpc.id
  }

}