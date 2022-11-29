data "aws_route_table" "rtb-maint-pub" {
  vpc_id = data.aws_vpc.vpc-maint1.id
  filter {
    name   = "tag:Name"
    values = ["rtb-maint-pub"]
  }
}
