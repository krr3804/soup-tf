provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "aws-efs-csi-driver" {
  name       = "aws-efs-csi-driver"
  depends_on = [aws_iam_policy.csi-driver-policy]

  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"
  chart      = "aws-efs-csi-driver"
  namespace  = "kube-system"

  set {
    name  = "serviceAccount.name"
    value = "efs-csi-controller-sa"
  }

  set {
    name  = "image.repository"
    value = format("602401143452.dkr.ecr.%s.amazonaws.com/eks/aws-efs-csi-driver", var.region)
  }

  set {
    name  = "image.tag"
    value = "v1.4.3"
  }

}
