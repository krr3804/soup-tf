# aws_iam_role_policy_attachment.eks-cluster-ServiceRole-HUIGIC7K7HNJ__AmazonEKSVPCResourceController:
resource "aws_iam_role_policy_attachment" "eks-cluster-ServiceRole-HUIGIC7K7HNJ__AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-cluster-ServiceRole-HUIGIC7K7HNJ.id
}