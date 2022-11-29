resource "aws_security_group" "soup-node-group-sg" {
  description = "Communication between all nodes in the cluster"
  vpc_id      = aws_vpc.vpc-prod1.id
  tags = {
    "Name"   = "soup-node-group-sg"
    "Label"  = "TF-EKS All Nodes Comms"
  }
}

output "allnodes-sg" {
  value = aws_security_group.soup-node-group-sg.id
}