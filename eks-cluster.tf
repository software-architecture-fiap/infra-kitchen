resource "aws_iam_role" "eks_role" {
  name = "eks_cluster_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "eks_policy" {
  name       = "eks_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "eks_lanchonete_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids         = aws_subnet.eks_subnet.*.id
    security_group_ids = [aws_security_group.eks-cluster-sg.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}

