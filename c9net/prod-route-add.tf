resource "aws_route" "rt-prod-pub-def" {
  route_table_id            = data.terraform_remote_state.net.outputs.rtb-prod-pub
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_route" "rt-prod-pri1-def" {
  route_table_id            = data.terraform_remote_state.net.outputs.rtb-prod-pri1
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_route" "rt-prod-pri2-def" {
  route_table_id            = data.terraform_remote_state.net.outputs.rtb-prod-pri2
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_route" "rt-prod-pub-maint" {
  route_table_id            = data.terraform_remote_state.net.outputs.rtb-prod-pub
  destination_cidr_block    = data.aws_vpc.vpc-maint1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.maint-peer.id
}

resource "aws_route" "rt-prod-pri1-maint" {
  route_table_id            = data.terraform_remote_state.net.outputs.rtb-prod-pri1
  destination_cidr_block    = data.aws_vpc.vpc-maint1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.maint-peer.id
}

resource "aws_route" "rt-prod-pri2-maint" {
  route_table_id            = data.terraform_remote_state.net.outputs.rtb-prod-pri2
  destination_cidr_block    = data.aws_vpc.vpc-maint1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.maint-peer.id
}