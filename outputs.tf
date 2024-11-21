output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks_lanchonete_cluster.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.eks_lanchonete_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  description = "EKS cluster certificate authority data"
  value       = aws_eks_cluster.eks_lanchonete_cluster.certificate_authority.0.data
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.eks_vpc.id
}

output "worker_role_arn" {
  description = "Worker node IAM role ARN"
  value       = aws_iam_role.eks_worker_role.arn
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.eks-cluster-sg.id
}