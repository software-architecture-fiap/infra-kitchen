variable "region" {
  description = "The default region for the AWS provider"
  default     = "us-east-1"
}

variable "cluster_name" {
  default = "lanchonete-cluster"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t3.medium"
}

variable "access_config" {
  description = "The authentication mode for the EKS cluster"
  default     = "API_AND_CONFIG_MAP"
}

variable "policy_arn" {
  description = "The ARN of the IAM policy to associate with the EKS cluster"
  # default     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  default     = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

# variable "principal_arn" {
#   description = "The ARN of the IAM principal to associate with the EKS cluster"
#   default     = "arn:aws:iam::830714066230:role/voclabs"
#   # default     = "arn:aws:iam::<account-id>:role/voclabs"
# }

variable "account_id" {
  description = "The AWS account ID"
  default     = "830714066230"
}
