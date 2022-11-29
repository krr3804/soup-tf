resource "aws_security_group" "maint-sg" {
  description = "maint all"
  vpc_id      = aws_vpc.vpc-maint1.id
  tags = {
    "Name" = "maint"
  }
}