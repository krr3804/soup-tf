data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-449f49ca2d5295cb"
    region = var.region
    key    = "terraform/terraform_locks_cluster.tfstate"
  }
}
