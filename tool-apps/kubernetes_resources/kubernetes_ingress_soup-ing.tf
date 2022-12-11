resource "kubernetes_ingress_v1" "soup-ingress" {
  metadata {
    annotations = { 
        "kubernetes.io/ingress.class" = "alb", 
        "alb.ingress.kubernetes.io/scheme" = "internet-facing", 
        "alb.ingress.kubernetes.io/target-type" = "instance", 
        "alb.ingress.kubernetes.io/listen-ports" = "[{\"HTTP\": 80},{\"HTTPS\": 443}]" 
        "alb.ingress.kubernetes.io/ssl-redirect" = "443"
        "alb.ingress.kubernetes.io/certificate-arn" =  "arn:aws:acm:ap-northeast-2:664966433367:certificate/2238ed3d-78a1-4aa2-bdec-43791e417f09"
        "alb.ingress.kubernetes.io/subnets" = "${data.terraform_remote_state.net.outputs.sub-prod-pub1},${data.terraform_remote_state.net.outputs.sub-prod-pub2}"
    }
    name        = "soup-ingress"
    namespace   = "ser-mgt"
  }

  spec {
    rule {
      host = "*.soupsale.shop"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "soup-frontend"
              port { 
                number = "3000"
              }
            }
          }
        }
      }
    }
  }
}