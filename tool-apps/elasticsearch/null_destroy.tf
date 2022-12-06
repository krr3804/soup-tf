resource "null_resource" "destroy" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    on_failure  = continue
    when        = destroy
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        echo "Remove es-master.yaml"
        kubectl patch -n es pvc/data-es-master-0 --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
        kubectl patch -n es pvc data-es-master-1 --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
        kubectl patch -n es pvc data-es-master-2 --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
        wait
        kubectl delete -f es-master.yaml 
        echo "done"
        fi
     EOT
  }
}