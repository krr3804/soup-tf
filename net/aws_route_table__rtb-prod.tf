# aws_route_table.rtb-041267f0474c24068:
resource "aws_route_table" "rtb-prod-pub" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-prod.id
  }
  tags = {
    "Name" = "rtb-prod-pub"
  }
  vpc_id = aws_vpc.vpc-prod1.id
}

resource "aws_route_table" "rtb-prod-pri1" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-prod-01.id
  }
  tags = {
    "Name" = "rtb-prod-pri1"
  }
  vpc_id = aws_vpc.vpc-prod1.id
}

resource "aws_route_table" "rtb-prod-pri2" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-prod-01.id
  }
  tags = {
    "Name" = "rtb-prod-pri2"
  }
  vpc_id = aws_vpc.vpc-prod1.id
}
