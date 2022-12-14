# provider "kubectl" {
#   host                   = data.aws_eks_cluster.eks_cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.eks.token
#   load_config_file       = false
# }
# data "kubectl_file_documents" "metrics-server-installation" {
#   content = file("components.yaml")
# }

# resource "kubectl_manifest" "metrics-server-installation" {
#   depends_on         = [null_resource.required_files]
#   count              = length(data.kubectl_file_documents.metrics-server-installation.documents)
#   yaml_body          = element(data.kubectl_file_documents.metrics-server-installation.documents, count.index)
#   override_namespace = "kube-system"
# }
