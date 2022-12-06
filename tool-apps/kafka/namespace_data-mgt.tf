resource "kubernetes_namespace" "namespace_data-mgt" {
  metadata {
    labels = {
      name = "data-mgt"
    }
    name = "data-mgt"
  }
}