
resource "aws_route_table_association" "rtbassoc-prod-pub-01" {
  route_table_id = aws_route_table.rtb-prod-pub.id
  subnet_id      = aws_subnet.subnet-prod-pub1.id
}

resource "aws_route_table_association" "rtbassoc-prod-pub-02" {
  route_table_id = aws_route_table.rtb-prod-pub.id
  subnet_id      = aws_subnet.subnet-prod-pub2.id
}

resource "aws_route_table_association" "rtbassoc-prod-pri-01" {
  route_table_id = aws_route_table.rtb-prod-pri1.id
  subnet_id      = aws_subnet.subnet-prod-pri1.id
}

resource "aws_route_table_association" "rtbassoc-prod-pri-02" {
  route_table_id = aws_route_table.rtb-prod-pri1.id
  subnet_id      = aws_subnet.subnet-prod-pri2.id
}

resource "aws_route_table_association" "rtbassoc-prod-pri-03" {
  route_table_id = aws_route_table.rtb-prod-pri2.id
  subnet_id      = aws_subnet.subnet-prod-pri3.id
}

resource "aws_route_table_association" "rtbassoc-prod-pri-04" {
  route_table_id = aws_route_table.rtb-prod-pri2.id
  subnet_id      = aws_subnet.subnet-prod-pri4.id
}

output "rtb-prod-pub" {
  value = aws_route_table.rtb-prod-pub.id
}

output "rtb-prod-pri1" {
  value = aws_route_table.rtb-prod-pri1.id
}

output "rtb-prod-pri2" {
  value = aws_route_table.rtb-prod-pri2.id
}