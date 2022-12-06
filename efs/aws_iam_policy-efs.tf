resource "aws_iam_policy" "csi-driver-policy" {
  depends_on  = [null_resource.policy]
  name        = "AmazonEKS_EFS_CSI_Driver_Policy"
  path        = "/"
  description = "AWS EKS CSI Driver IAM Policy"

  policy = file("iam-policy-example.json")

}