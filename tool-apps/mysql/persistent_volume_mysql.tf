# mysql-pv1
resource "kubernetes_persistent_volume" "mysql-pv1" {
  depends_on = [kubernetes_storage_class.mysql-efs-sc]
  metadata {
    name = "mysql-pv1"
    labels = {
      type = "mysql"
    }
  }

  spec {
    storage_class_name = "mysql-efs-sc"
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = data.terraform_remote_state.efs.outputs.mysql-efs1
      }
    }
  }
}

# mysql-pv2
resource "kubernetes_persistent_volume" "mysql-pv2" {
  depends_on = [kubernetes_storage_class.mysql-efs-sc]
  metadata {
    name = "mysql-pv2"
    labels = {
      type = "mysql"
    }
  }

  spec {
    storage_class_name = "mysql-efs-sc"
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = data.terraform_remote_state.efs.outputs.mysql-efs2
      }
    }
  }
}
