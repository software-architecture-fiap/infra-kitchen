resource "aws_eks_cluster" "lanchonete-eks-cluster" {
  name     = var.cluster_name
  role_arn = data.aws_iam_role.eks-cluster-role.arn

  vpc_config {
    subnet_ids         = [for subnet in var.var.eks_subnet_ids : subnet.id]
    security_group_ids = [aws_security_group.eks-cluster-sg.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}
