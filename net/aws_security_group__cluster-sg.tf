resource "aws_security_group" "soup-cluster-sg" {
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = aws_vpc.vpc-prod1.id
  tags = {
    "Name"  = "soup-cluster-sg"
    "Label" = "TF-EKS Control Plane & all worker nodes comms"
  }
}

output "cluster-sg" {
  value = aws_security_group.soup-cluster-sg.id
}