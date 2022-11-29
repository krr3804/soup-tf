resource "aws_route_table" "rtb-maint-pub" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-maint.id
  }
  tags = {
    "Name" = "rtb-maint-pub"
  }
  vpc_id = aws_vpc.vpc-maint1.id
}