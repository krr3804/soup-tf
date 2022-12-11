data "kubectl_file_documents" "calico-opeartor-installation" {
  content = file("calico-operator.yaml")
}

resource "kubectl_manifest" "calico-opeartor-installation" {
  depends_on         = [kubectl_manifest.metrics-server-installation]
  count              = length(data.kubectl_file_documents.calico-opeartor-installation.documents)
  yaml_body          = element(data.kubectl_file_documents.calico-opeartor-installation.documents, count.index)
  override_namespace = "calico-system"
}

data "kubectl_file_documents" "calico-crs-installation" {
  content = file("calico-crs.yaml")
}

resource "kubectl_manifest" "calico-crs-installation" {
  depends_on         = [kubectl_manifest.calico-opeartor-installation]
  count              = length(data.kubectl_file_documents.calico-crs-installation.documents)
  yaml_body          = element(data.kubectl_file_documents.calico-crs-installation.documents, count.index)
  override_namespace = "calico-system"
}
