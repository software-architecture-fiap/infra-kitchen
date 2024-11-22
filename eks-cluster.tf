resource "aws_eks_cluster" "eks_lanchonete_cluster" {
  name     = "EKS-${var.cluster_name}"
  role_arn = data.aws_iam_role.eks_labrole.arn

  vpc_config {
    subnet_ids         = aws_subnet.eks_subnet[*].id
    security_group_ids = [aws_security_group.eks_cluster_security_group.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}

