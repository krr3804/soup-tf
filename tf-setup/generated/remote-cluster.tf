data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-46da5b19f3070ebb"
    region = var.region
    key    = "terraform/terraform_locks_cluster.tfstate"
  }
}
