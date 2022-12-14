data "aws_ami" "base_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS-7-2111-20220825_1.x86_64-*"]
  }
}