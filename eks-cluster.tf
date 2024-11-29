resource "aws_eks_cluster" "eks_lanchonete_cluster" {
  name     = "EKS-${var.cluster_name}"
  role_arn = data.aws_iam_role.eks_labrole.arn

  vpc_config {
    subnet_ids         = aws_subnet.eks_subnet[*].id
    security_group_ids = [aws_security_group.eks_lanchonete_cluster_security_group.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}

# resource "aws_iam_policy_attachment" "attach_ebs_csi_policy" {
#   name       = "Attach_EBS_CSI_Driver_Policy"
#   roles      = ["LabRole"]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicy"
# }

resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = aws_eks_cluster.eks_lanchonete_cluster.name
  addon_name   = "aws-ebs-csi-driver"

  tags = {
    name = "ebs-lanchonete-csi-driver"
  }

}
