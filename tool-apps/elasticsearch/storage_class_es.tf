resource "kubernetes_storage_class" "es-efs-sc" {
  metadata {
    name = "es-efs-sc"
  }

  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Delete"
}