data "terraform_remote_state" "iam" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-58c567f7ab45ae55"
    region = var.region
    key    = "terraform/terraform_locks_net.tfstate"
  }
}
