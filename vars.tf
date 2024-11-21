variable "default_region" {
  description = "The default region for the AWS provider"
  default     = "us-east-1"
  type        = string
}

variable "cluster_name" {
  default = "lanchonete-eks-cluster"
  type    = string
}

variable "cluster_role" {
  default = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "eks_subnet_ids" {
  description = "The IDs of the subnets to launch the EKS cluster into"
  type        = list(string)
}

variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t3a.medium"
}

variable "access_config" {
  description = "The authentication mode for the EKS cluster"
  default     = "API_AND_CONFIG_MAP"
}

variable "policy_arn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}
