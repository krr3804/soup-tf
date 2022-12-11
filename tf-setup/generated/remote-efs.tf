data "terraform_remote_state" "efs" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-449f49ca2d5295cb"
    region = var.region
    key    = "terraform/terraform_locks_efs.tfstate"
  }
}
