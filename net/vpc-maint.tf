resource "aws_vpc" "vpc-maint1" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "192.168.0.0/24"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name" = "vpc-maint-1"
  }
}

output "vpc-maint1" {
  value = aws_vpc.vpc-maint1.id
}

output "vpc-maint1-cidr" {
  value = aws_vpc.vpc-maint1.cidr_block
}