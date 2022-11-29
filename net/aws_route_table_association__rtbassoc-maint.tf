resource "aws_route_table_association" "rtbassoc-maint-pub" {
  route_table_id = aws_route_table.rtb-maint-pub.id
  subnet_id      = aws_subnet.subnet-maint-pub.id
}

output "rtb-maint-pub" {
  value = aws_route_table.rtb-maint-pub.id
}