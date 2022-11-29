# aws_vpc_endpoint.vpce-s3:
resource "aws_vpc_endpoint" "vpce-s3" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
      Version = "2008-10-17"
    }
  )
  private_dns_enabled = false
  route_table_ids = [
    aws_route_table.rtb-prod-pub.id,
    aws_route_table.rtb-prod-pri1.id,
    aws_route_table.rtb-prod-pri2.id
  ]
  security_group_ids = []
  service_name       = format("com.amazonaws.%s.s3", data.aws_region.current.name)
  subnet_ids         = []
  tags               = {}
  vpc_endpoint_type  = "Gateway"
  vpc_id             = aws_vpc.vpc-prod1.id

  timeouts {}
}