resource "aws_security_group" "soup-efs-sg" {
  depends_on  = [helm_release.aws-efs-csi-driver]
  description = "Soup EFS security group"
  vpc_id      = data.terraform_remote_state.net.outputs.vpc-prod1
  tags = {
    "Name"  = "SoupEfsSecurityGroup"
    "Label" = "TF-EKS EFS comm"
  }
}

output "efs-sg" {
  value = aws_security_group.soup-efs-sg.id
}

resource "aws_security_group_rule" "eks-efs" {
  depends_on        = [aws_security_group.soup-efs-sg]
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = [data.terraform_remote_state.net.outputs.vpc-prod1-cidr]
  security_group_id = aws_security_group.soup-efs-sg.id
}