resource "kubernetes_service" "es-client-svc" {
  depends_on = [kubernetes_namespace.namespace_es]
  metadata {
    name      = "http-rest6"
    namespace = "es"
    labels = {
      node_type = "es-client"
    }
  }
  spec {
    type = "ClusterIP"
    port {
      port        = 80
      target_port = 9200
      protocol    = "TCP"
    }
    selector = {
      node_type = "es-client"
    }
  }
}

resource "kubernetes_stateful_set" "es-client-ss" {
  depends_on = [kubernetes_namespace.namespace_es]
  metadata {
    name      = "es-client"
    namespace = "es"
  }
  spec {
    service_name = "es"
    replicas     = 1

    selector {
      match_labels = {
        app = "elasticsearch"
      }
    }

    template {
      metadata {
        labels = {
          app       = "elasticsearch"
          node_type = "es-client"
        }
      }
      spec {
        node_selector = {
          "eks/nodegroup-name" = format("ng2-%s", data.aws_eks_cluster.eks_cluster.name)
        }
        init_container {
          name              = "increase-the-vm-max-map-count"
          image             = "busybox:latest"
          image_pull_policy = "IfNotPresent"
          command           = ["sysctl", "-w", "vm.max_map_count=262144"]
          security_context {
            privileged = true
          }
        }
        init_container {
          name              = "increase-the-ulimit"
          image             = "busybox:latest"
          image_pull_policy = "IfNotPresent"
          command           = ["sh", "-c", "ulimit -n 65536"]
          security_context {
            privileged = true
          }
        }
        container {
          name              = "elasticsearch"
          image             = "aam411/elasticsearch_nori:1.1"
          image_pull_policy = "Always"
          resources {
            limits = {
              cpu = "1000m"
            }
            requests = {
              cpu = "100m"
            }
          }
          port {
            container_port = 9300
            name           = "inter-node"
            protocol       = "TCP"
          }

          port {
            container_port = 9200
            name           = "rest"
            protocol       = "TCP"
          }
          env {
            name = "HOSTNAME"
            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }
          env {
            name  = "node.name"
            value = "es-client-0.es.es.svc.cluster.local"
          }
          env {
            name = "network.host"
            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }
          env {
            name  = "cluster.name"
            value = "es-cluster-1"
          }
          env {
            name  = "cluster.initial_master_nodes"
            value = "es-master-0.es.es.svc.cluster.local,es-master-1.es.es.svc.cluster.local,es-master-2.es.es.svc.cluster.local"
          }
          env {
            name  = "discovery.seed_hosts"
            value = "es-master-0.es.es.svc.cluster.local,es-master-1.es.es.svc.cluster.local,es-master-2.es.es.svc.cluster.local,es-client-0.es.es.svc.cluster.local"
          }
          env {
            name  = "node.master"
            value = "false"
          }
          env {
            name  = "node.data"
            value = "false"
          }
          env {
            name  = "ES_JAVA_OPTS"
            value = "-Xms1G -Xmx1G"
          }
        }
      }
    }
  }
}