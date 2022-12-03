# aws_eip.eipalloc-052dd24eaa93ed064:
resource "aws_eip" "eipalloc-prod-ngw-01" {
  public_ipv4_pool = "amazon"
  tags             = {}
  vpc              = true

  timeouts {}
}

resource "aws_eip" "eipalloc-prod-ngw-02" {
  public_ipv4_pool = "amazon"
  tags             = {}
  vpc              = true

  timeouts {}
}

# aws_nat_gateway.nat-07b271e3a84d0d94a:
resource "aws_nat_gateway" "nat-prod-01" {
  allocation_id = aws_eip.eipalloc-prod-ngw-01.id
  subnet_id     = aws_subnet.subnet-prod-pub1.id
  tags = {
    "Name" = "ngw-prod-01"
  }
}

resource "aws_nat_gateway" "nat-prod-02" {
  allocation_id = aws_eip.eipalloc-prod-ngw-02.id
  subnet_id     = aws_subnet.subnet-prod-pub2.id
  tags = {
    "Name" = "ngw-prod-02"
  }
}