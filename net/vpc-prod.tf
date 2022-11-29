resource "aws_vpc" "vpc-prod1" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.0.0.0/20"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name"                                        = "vpc-prod-1"
  }
}

output "vpc-prod1" {
  value = aws_vpc.vpc-prod1.id
}

output "vpc-prod1-cidr" {
  value = aws_vpc.vpc-prod1.cidr_block
}