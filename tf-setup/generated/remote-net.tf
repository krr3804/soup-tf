data "terraform_remote_state" "net" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-46da5b19f3070ebb"
    region = var.region
    key    = "terraform/terraform_locks_net.tfstate"
  }
}
