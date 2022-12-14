resource "kubernetes_horizontal_pod_autoscaler_v2beta2" "soup-search-backend-hpa" {
  metadata {
    name      = "soup-search-backend"
    namespace = "ser-mgt"
  }
  spec {
    min_replicas = 2
    max_replicas = 4

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "soup-search-backend"
    }

    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type  = "Utilization"
          average_utilization = "70"
        }
      }
    }

    behavior {
      scale_down {
        stabilization_window_seconds = 120
        select_policy                = "Min"
        policy {
          period_seconds = 120
          type           = "Pods"
          value          = 1
        }

        policy {
          period_seconds = 30
          type           = "Percent"
          value          = 25
        }
      }
      scale_up {
        stabilization_window_seconds = 120
        select_policy                = "Max"
        policy {
          period_seconds = 30
          type           = "Percent"
          value          = 25
        }
        policy {
          period_seconds = 120
          type           = "Pods"
          value          = 1
        }
      }
    }
  }
}