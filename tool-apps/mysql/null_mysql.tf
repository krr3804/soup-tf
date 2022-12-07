resource "null_resource" "mysql" {
  depends_on = [kubernetes_persistent_volume.mysql-pv2]
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    on_failure  = fail
    when        = create
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        kubectl apply -f https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-crds.yaml
        wait
        kubectl apply -f https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-operator.yaml
        wait
        kubectl create secret generic mypwds -n mysql-operator \
        --from-literal=rootUser=root \
        --from-literal=rootHost=% \
        --from-literal=rootPassword="sakila"
        wait
        kubectl apply -f cluster.yaml
     EOT
  }
}