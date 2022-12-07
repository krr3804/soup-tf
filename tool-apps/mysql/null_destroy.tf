resource "null_resource" "destroy" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    on_failure  = continue
    when        = destroy
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        echo "Remove cluster.yaml"
        kubectl delete -f cluster.yaml 
        echo "done"
        wait
        echo "Remove mysql-operator.yaml"
        kubectl delete -f https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-operator.yaml
        echo "done"
        wait
        echo "Remove deploy-crds.yaml"
        kubectl delete -f https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-crds.yaml
        echo "done"
     EOT
  }
}