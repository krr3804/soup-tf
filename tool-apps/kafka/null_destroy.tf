resource "null_resource" "destroy" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    on_failure  = continue
    when        = destroy
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        echo "Remove kafka"
        kubectl delete -f 'https://strimzi.io/examples/latest/kafka/kafka-ephemeral.yaml' -n data-mgt
        echo "done"
        wait
        echo "Remove strimzi"
        kubectl delete -f 'https://strimzi.io/install/latest?namespace=data-mgt' -n data-mgt
        echo "done"
        wait
     EOT
  }
}