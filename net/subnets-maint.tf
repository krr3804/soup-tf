resource "aws_subnet" "subnet-maint-pub" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "192.168.0.0/25"
  map_public_ip_on_launch         = true
  tags = {
    "Name" = "sbn-maint-pub"
  }
  vpc_id = aws_vpc.vpc-maint1.id

  timeouts {}
}
