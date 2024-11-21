resource "aws_eks_cluster" "lanchonete-eks-cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role

  vpc_config {
    subnet_ids         = ["${var.subnet_a}", "${var.subnet_b}", "${var.subnet_c}"]
    security_group_ids = [aws_security_group.eks-cluster-sg.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}
  