resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO.id
}