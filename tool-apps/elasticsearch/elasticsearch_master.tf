# resource "kubernetes_service" "es-master-svc" {
#   depends_on = [kubernetes_namespace.es_namespace]
#   metadata {
#     name      = "es"
#     namespace = "es"
#     labels = {
#       app = "elasticsearch"
#     }
#   }
#   spec {
#     type = "ClusterIP"
#     port {
#       port = 9300
#       name = "inter-node"
#     }
#     port {
#       port = 9200
#       name = "rest"
#     }
#     selector = {
#       app = "elasticsearch"
#     }
#   }
# }

resource "null_resource" "es-master-ss" {
  depends_on = [kubernetes_namespace.namespace_es]
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    on_failure  = fail
    when        = create
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        kubectl apply -f es-master.yaml
     EOT
  }
}

# resource "kubernetes_stateful_set" "es-master-ss" {
#   depends_on = [kubernetes_namespace.es_namespace]
#   metadata {
#     name      = "es-master"
#     namespace = "es"
#   }
#   spec {
#     service_name = "es"
#     replicas     = 3

#     selector {
#       match_labels = {
#         app = "elasticsearch"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "elasticsearch"
#         }
#       }
#       spec {
#         node_selector = {
#           "eks/nodegroup-name" = format("ng2-%s", data.aws_eks_cluster.eks_cluster.name)
#         }
#         init_container {
#           name              = "fix-the-volume-permission"
#           image             = "busybox:latest"
#           image_pull_policy = "IfNotPresent"
#           command           = ["chown", "-R", "1000:1000", "/usr/share/elasticsearch/data"]
#           security_context {
#             privileged = true
#           }
#           volume_mount {
#             name       = "data"
#             mount_path = "/usr/share/elasticsearch/data"
#           }
#         }

#         init_container {
#           name              = "increase-the-vm-max-map-count"
#           image             = "busybox:latest"
#           image_pull_policy = "IfNotPresent"
#           command           = ["sysctl", "-w", "vm.max_map_count=262144"]
#           security_context {
#             privileged = true
#           }
#         }
#         init_container {
#           name              = "increase-the-ulimit"
#           image             = "busybox:latest"
#           image_pull_policy = "IfNotPresent"
#           command           = ["sh", "-c", "ulimit -n 65536"]
#           security_context {
#             privileged = true
#           }
#         }

#         container {
#           name              = "elasticsearch"
#           image             = "aam411/elasticsearch_nori:1.0"
#           image_pull_policy = "Always"
#           resources {
#             limits = {
#               cpu = "1000m"
#             }
#             requests = {
#               cpu = "200m"
#             }
#           }
#           port {
#             container_port = 9300
#             name           = "inter-node"
#             protocol       = "TCP"
#           }

#           port {
#             container_port = 9200
#             name           = "rest"
#             protocol       = "TCP"
#           }
#           env {
#             name = "HOSTNAME"
#             value_from {
#               field_ref {
#                 field_path = "metadata.name"
#               }
#             }
#           }
#           env {
#             name  = "node.name"
#             value = "${kubernetes_stateful_set.es-master-ss.metadata[0].name}.es.es.svc.cluster.local"
#           }
#           env {
#             name = "network.host"
#             value_from {
#               field_ref {
#                 field_path = "status.podIP"
#               }
#             }
#           }
#           env {
#             name  = "cluster.name"
#             value = "es-cluster-1"
#           }
#           env {
#             name  = "cluster.initial_master_nodes"
#             value = "es-master-0.es.es.svc.cluster.local,es-master-1.es.es.svc.cluster.local,es-master-2.es.es.svc.cluster.local"
#           }
#           env {
#             name  = "discovery.seed_hosts"
#             value = "es-master-0.es.es.svc.cluster.local,es-master-1.es.es.svc.cluster.local,es-master-2.es.es.svc.cluster.local,es-client-0.es.es.svc.cluster.local"
#           }
#           env {
#             name  = "node.master"
#             value = "true"
#           }
#           env {
#             name  = "node.data"
#             value = "true"
#           }
#           env {
#             name  = "ES_JAVA_OPTS"
#             value = "-Xms2G -Xmx2G"
#           }
#         }
#       }
#     }

#     volume_claim_template {
#       metadata {
#         name = "data"
#         labels = {
#           app = "elasticsearch"
#         }
#       }
#       spec {
#         access_modes       = ["ReadWriteOnce"]
#         storage_class_name = "es-efs-sc"
#         resources {
#           requests = {
#             storage = "10Gi"
#           }
#         }

#       }
#     }
#   }
# }