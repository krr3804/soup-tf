# aws_subnet.subnet-prod-pri1:
resource "aws_subnet" "subnet-prod-pri1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.0.2.0/23"
  map_public_ip_on_launch         = false
  tags = {
    "Name" = "sbn-prod-pri-01a"
  }
  vpc_id = aws_vpc.vpc-prod1.id

  timeouts {}
}

output "sub-prod-pri1" {
  value = aws_subnet.subnet-prod-pri1.id
}

# aws_subnet.subnet-prod-pri-2:
resource "aws_subnet" "subnet-prod-pri2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "10.0.4.0/23"
  map_public_ip_on_launch         = false
  tags = {
    "Name" = "sbn-prod-pri-01c"
  }
  vpc_id = aws_vpc.vpc-prod1.id

  timeouts {}
}

output "sub-prod-pri2" {
  value = aws_subnet.subnet-prod-pri2.id
}

# aws_subnet.subnet-prod-pri-3:
resource "aws_subnet" "subnet-prod-pri3" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.0.6.0/23"
  map_public_ip_on_launch         = false
  tags = {
    "Name" = "sbn-prod-pri-02a"
  }
  vpc_id = aws_vpc.vpc-prod1.id

  timeouts {}
}

output "sub-prod-pri3" {
  value = aws_subnet.subnet-prod-pri3.id
}

# aws_subnet.subnet-prod-pri-2:
resource "aws_subnet" "subnet-prod-pri4" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "10.0.8.0/23"
  map_public_ip_on_launch         = false
  tags = {
    "Name" = "sbn-prod-pri-02c"
  }
  vpc_id = aws_vpc.vpc-prod1.id

  timeouts {}
}

output "sub-prod-pri4" {
  value = aws_subnet.subnet-prod-pri4.id
}


# aws_subnet.subnet-prod-pub1:
resource "aws_subnet" "subnet-prod-pub1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = "10.0.0.0/24"
  map_public_ip_on_launch         = true
  tags = {
    "Name" = "sbn-prod-pub-01a"
  }
  vpc_id = aws_vpc.vpc-prod1.id

  timeouts {}
}


output "sub-prod-pub1" {
  value = aws_subnet.subnet-prod-pub1.id
}

# aws_subnet.subnet-prod-pub2:
resource "aws_subnet" "subnet-prod-pub2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = "10.0.1.0/24"
  map_public_ip_on_launch         = true
  tags = {
    "Name" = "sbn-prod-pub-01c"
  }
  vpc_id = aws_vpc.vpc-prod1.id

  timeouts {}
}


output "sub-prod-pub2" {
  value = aws_subnet.subnet-prod-pub2.id
}
