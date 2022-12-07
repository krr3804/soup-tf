data "terraform_remote_state" "lb" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-96c06be1ea4387b8"
    region = var.region
    key    = "terraform/terraform_locks_lb.tfstate"
  }
}
