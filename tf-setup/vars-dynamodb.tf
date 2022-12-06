variable "table_name_net" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_net"
}

variable "table_name_iam" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_iam"
}

variable "table_name_c9net" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_c9net"
}

variable "table_name_cluster" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_cluster"
}

variable "table_name_nodeg" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_nodeg"
}

variable "table_name_maint" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_maint"
}

variable "table_name_lb" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_lb"
}

variable "table_name_efs" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_efs"
}

variable "table_name_tool-apps" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_tool-apps"
}

variable "table_name_tf-setup" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_tf-setup"
}

variable "stages" {
  type    = list(string)
  default = ["net", "iam", "c9net", "cluster", "nodeg", "maint", "lb", "efs", "tool-apps", "tf-setup"]
}

variable "stagecount" {
  type    = number
  default = 10
}