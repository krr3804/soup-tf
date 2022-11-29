# aws_internet_gateway.igw-02c295b01d50c9q3r:
resource "aws_internet_gateway" "igw-maint" {
  tags = {
    "Name" = "igw-maint"
  }
  vpc_id = aws_vpc.vpc-maint1.id
}