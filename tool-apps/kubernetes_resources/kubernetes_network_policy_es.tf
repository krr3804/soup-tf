resource "kubernetes_network_policy_v1" "np-es" {
  metadata {
    name      = "np-es"
    namespace = "es"
  }

  spec {
    pod_selector {
      match_labels = {}
    }

    ingress {
      ports {
        port     = "9200"
        protocol = "TCP"
      }

      from {
        namespace_selector {
          match_labels = {
            kubernetes.io/metadata.name = "ser-mgt"
          }
        }
      }

      from {
        namespace_selector {
          match_labels = {
            kubernetes.io/metadata.name = "data-mgt"
          }
        }
      }
    }

    egress {} # single empty rule to allow all egress traffic

    policy_types = ["Ingress", "Egress"]
  }
}