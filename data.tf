data "aws_iam_role" "eks-cluster-role" {
  name = "lanchonete-eks-cluster-role"
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

data "aws_subnets" "eks-subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "eks-subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}
