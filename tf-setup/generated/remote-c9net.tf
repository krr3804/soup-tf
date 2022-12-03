data "terraform_remote_state" "c9net" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-c38d64ca4ac271b1"
    region = var.region
    key    = "terraform/terraform_locks_iam.tfstate"
  }
}
