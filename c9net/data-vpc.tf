data "aws_vpc" "vpc-default" {
  default = true
}

data "aws_vpc" "vpc-maint1" {
  default = false
  id      = data.terraform_remote_state.net.outputs.vpc-maint1
}