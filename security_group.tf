resource "aws_security_group" "eks-cluster-sg" {
  name        = "SG-${var.cluster_name}"
  description = "Security group for EKS cluster"
  vpc_id      = aws_vpc.eks_vpc.id

  ingress {
    description = "Allow all HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow all HTTPS inbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow VPC inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/16"]
  }

  tags = {
    Name = "eks_cluster_sg"
  }
}
