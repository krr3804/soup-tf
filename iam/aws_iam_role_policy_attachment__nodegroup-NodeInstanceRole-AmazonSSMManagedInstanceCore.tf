# aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__AmazonSSMManagedInstanceCore:
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO.id
}