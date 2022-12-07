data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-96c06be1ea4387b8"
    region = var.region
    key    = "terraform/terraform_locks_cluster.tfstate"
  }
}
