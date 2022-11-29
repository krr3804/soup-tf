resource "aws_vpc_peering_connection" "maint-peer" {
  peer_vpc_id = data.terraform_remote_state.net.outputs.vpc-prod1
  vpc_id      = data.aws_vpc.vpc-maint1.id
  auto_accept = true
}

output "maint-peerid" {
  value = aws_vpc_peering_connection.maint-peer.id
}