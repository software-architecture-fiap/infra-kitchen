variable "region" {
  description = "The default region for the AWS provider"
  default     = "us-east-1"
  type        = string
}

// Change the account_id to your AWS account ID
# variable "account_id" {
#   default = "830714066230"
#   type    = string
# }

variable "cluster_name" {
  default = "eks-lanchonete-cluster"
  type    = string
}

# variable "cluster_role" {
#   default = "arn:aws:iam::830714066230:role/eks-cluster-role"
# }

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t3.medium"
}

# variable "instance_name" {
#   description = "EC2 instance name"
#   default     = "Provisioned by Terraform"
# }

variable "access_config" {
  description = "The authentication mode for the EKS cluster"
  default     = "API_AND_CONFIG_MAP"
}

# variable "policy_arn" {
#   default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
# }
