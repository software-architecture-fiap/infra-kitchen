resource "aws_eks_access_entry" "eks_lanchonete_access_entry" {
  cluster_name      = aws_eks_cluster.eks_lanchonete_cluster.name
  principal_arn     = var.policy_arn
  kubernetes_groups = ["fiap-tc"]
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_lanchonete_policy_association" {
  cluster_name  = aws_eks_cluster.eks_lanchonete_cluster.name
  policy_arn    = var.policy_arn
  principal_arn = var.principal_arn

  access_scope {
    type = "cluster"
  }
}

resource "aws_iam_role_policy_attachment" "eks_admin_policy" {
  role = "voclabs"
  policy_arn = var.policy_arn  
}