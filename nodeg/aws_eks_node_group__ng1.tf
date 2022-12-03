resource "aws_eks_node_group" "ng1" {
  #ami_type       = "AL2_x86_64"
  depends_on     = [aws_launch_template.lt-ng1]
  cluster_name   = data.aws_eks_cluster.eks_cluster.name
  disk_size      = 0
  instance_types = []
  labels = {
    "eks/cluster-name"   = data.aws_eks_cluster.eks_cluster.name
    "eks/nodegroup-name" = format("ng1-%s", data.aws_eks_cluster.eks_cluster.name)
  }
  node_group_name = format("ng1-%s", data.aws_eks_cluster.eks_cluster.name)
  node_role_arn   = data.terraform_remote_state.iam.outputs.nodegroup_role_arn

  subnet_ids = [
    data.terraform_remote_state.net.outputs.sub-prod-pri1,
    data.terraform_remote_state.net.outputs.sub-prod-pri2,

  ]
  tags = {
    "eks/cluster-name"                            = data.aws_eks_cluster.eks_cluster.name
    "eks/nodegroup-name"                          = format("ng1-%s", data.aws_eks_cluster.eks_cluster.name)
    "eks/nodegroup-type"                          = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = data.aws_eks_cluster.eks_cluster.name
  }
  #version = "1.17"

  launch_template {
    name    = aws_launch_template.lt-ng1.name
    version = "1"
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  timeouts {}
}