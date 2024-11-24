data "aws_iam_role" "eks_labrole" {
  name = "LabRole"
}

# data "aws_ssm_parameter" "eks_ami" {
#   // 1.27 refers to the Kubernetes version
#   name = "/aws/service/eks/optimized-ami/1.27/amazon-linux-2/recommended/image_id"
# }

# data "aws_vpc" "eks_vpc" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name = "eks-vpc"
#   }
# }