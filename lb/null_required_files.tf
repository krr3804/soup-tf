# resource "null_resource" "required_files" {
#   depends_on = [helm_release.aws-load-balancer-controller]
#   triggers = {
#     always_run = timestamp()
#   }
#   provisioner "local-exec" {
#     on_failure  = fail
#     when        = create
#     interpreter = ["/bin/bash", "-c"]
#     command     = <<EOT
#             rm -rf components.yaml*
#             rm -rf calico-operator.yaml*
#             rm -rf calico-crs.yaml*
#             wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
#             wget https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/master/config/master/calico-operator.yaml
#             wget https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/master/config/master/calico-crs.yaml
#             sleep 3;
#     EOT
#   }
# }