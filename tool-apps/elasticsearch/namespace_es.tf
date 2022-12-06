resource "kubernetes_namespace" "namespace_es" {
  metadata {
    labels = {
      name = "es"
    }
    name = "es"
  }
}