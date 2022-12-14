data "aws_eks_cluster" "eks_cluster" {
  name = data.terraform_remote_state.cluster.outputs.cluster-name
}

data "aws_eks_cluster_auth" "eks" {
  name = data.aws_eks_cluster.eks_cluster.name
}
