resource "null_resource" "kafka" {
  depends_on = [kubernetes_namespace.namespace_data-mgt]
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    on_failure  = fail
    when        = create
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        # 1. Strimzi Operator 설치
        echo "Strimzi Operator Installation"
        kubectl apply -f 'https://strimzi.io/install/latest?namespace=data-mgt' -n data-mgt
        echo "done"
        wait
        # 2. kafka 설치
        echo "Kafka Installation"
        kubectl apply -f 'https://strimzi.io/examples/latest/kafka/kafka-ephemeral.yaml' -n data-mgt
        echo "done"
     EOT
  }
}