provider "kubectl" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
  load_config_file       = false
}

data "kubectl_file_documents" "namespace_argocd" {
    content = file("namespace_argocd.yaml")
} 

data "kubectl_file_documents" "argocd-installation" {
  content = file("install.yaml")
}

resource "kubectl_manifest" "namespace_argocd" {
    count     = length(data.kubectl_file_documents.namespace_argocd.documents)
    yaml_body = element(data.kubectl_file_documents.namespace_argocd.documents, count.index)
    override_namespace = "argocd"
}


resource "kubectl_manifest" "argocd-installation" {
  depends_on         = [kubectl_manifest.namespace_argocd]
  count              = length(data.kubectl_file_documents.argocd-installation.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd-installation.documents, count.index)
  override_namespace = "argocd"
}
