resource "aws_route" "rt-maint" {
  route_table_id            = data.aws_route_table.rtb-maint-pub.id
  destination_cidr_block    = data.terraform_remote_state.net.outputs.vpc-prod1-cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.maint-peer.id
}