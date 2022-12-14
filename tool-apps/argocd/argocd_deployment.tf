data "kubectl_file_documents" "namespace_ser-mgt" {
  content = file("namespace_ser-mgt.yaml")
}

data "kubectl_file_documents" "argocd-deployment" {
  content = file("repos.yaml")
}

resource "kubectl_manifest" "namespace_ser-mgt" {
  depends_on         = [kubectl_manifest.argocd-installation]
  count              = length(data.kubectl_file_documents.namespace_ser-mgt.documents)
  yaml_body          = element(data.kubectl_file_documents.namespace_ser-mgt.documents, count.index)
  override_namespace = "ser-mgt"
}


resource "kubectl_manifest" "argocd-deployment" {
  depends_on         = [kubectl_manifest.namespace_ser-mgt]
  count              = length(data.kubectl_file_documents.argocd-deployment.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd-deployment.documents, count.index)
  override_namespace = "argocd"
}