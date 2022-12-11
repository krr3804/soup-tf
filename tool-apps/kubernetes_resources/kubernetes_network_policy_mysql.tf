resource "kubernetes_network_policy_v1" "np-mysql" {
  metadata {
    name      = "np-mysql"
    namespace = "mysql-operator"
  }

  spec {
    pod_selector {
      match_labels = {}
    }

    ingress {
      ports {
        port     = "3306"
        protocol = "TCP"
      }

      from {
        namespace_selector {
          match_labels = {
            kubernetes.io/metadata.name = "ser-mgt"
          }
        }
      }
    }

    egress {} # single empty rule to allow all egress traffic

    policy_types = ["Ingress", "Egress"]
  }
}