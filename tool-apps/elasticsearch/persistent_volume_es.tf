# es-pv1
resource "kubernetes_persistent_volume" "es-pv1" {
  depends_on = [kubernetes_storage_class.es-efs-sc]
  metadata {
    name = "es-pv1"
    labels = {
      type = "es"
    }
  }

  spec {
    storage_class_name = "es-efs-sc"
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = data.terraform_remote_state.efs.outputs.es-efs1
      }
    }
  }
}

# es-pv2
resource "kubernetes_persistent_volume" "es-pv2" {
  depends_on = [kubernetes_storage_class.es-efs-sc]
  metadata {
    name = "es-pv2"
    labels = {
      type = "es"
    }
  }

  spec {
    storage_class_name = "es-efs-sc"
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = data.terraform_remote_state.efs.outputs.es-efs2
      }
    }
  }
}

# es-pv3
resource "kubernetes_persistent_volume" "es-pv3" {
  depends_on = [kubernetes_storage_class.es-efs-sc]
  metadata {
    name = "es-pv3"
    labels = {
      type = "es"
    }
  }

  spec {
    storage_class_name = "es-efs-sc"
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = data.terraform_remote_state.efs.outputs.es-efs3
      }
    }
  }
}