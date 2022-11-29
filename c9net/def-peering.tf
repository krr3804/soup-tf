resource "aws_vpc_peering_connection" "def-peer" {
  peer_vpc_id = data.terraform_remote_state.net.outputs.vpc-prod1
  vpc_id      = data.aws_vpc.vpc-default.id
  auto_accept = true
}

output "def-peerid" {
  value = aws_vpc_peering_connection.def-peer.id
}