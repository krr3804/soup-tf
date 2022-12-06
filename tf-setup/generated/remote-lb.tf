data "terraform_remote_state" "lb" {
  backend = "s3"
  config = {
    bucket = "tf-state-soup-c0e876bc26e9639f"
    region = var.region
    key    = "terraform/terraform_locks_lb.tfstate"
  }
}
