# aws_internet_gateway.igw-02c295b01d50c9q3r:
resource "aws_internet_gateway" "igw-prod" {
  tags = {
    "Name" = "igw-prod"
  }
  vpc_id = aws_vpc.vpc-prod1.id
}