resource "kubernetes_storage_class" "mysql-efs-sc" {
  metadata {
    name = "mysql-efs-sc"
  }

  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Delete"
}