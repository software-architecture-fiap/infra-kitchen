resource "aws_iam_role" "eks_worker_role" {
  name = "eks_worker_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "eks_worker_policy" {
  name       = "eks_worker_policy"
  roles      = [aws_iam_role.eks_worker_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_launch_configuration" "worker_launch_config" {
  name_prefix          = "eks-worker-node"
  image_id             = data.aws_ssm_parameter.eks_ami.value
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_role.eks_worker_role.name
}

resource "aws_autoscaling_group" "worker_auto_scaling_group" {
  name                 = "eks-worker-node-asg"
  min_size             = 1
  desired_capacity     = 2
  max_size             = 3
  launch_configuration = aws_launch_configuration.worker_launch_config.id
  vpc_zone_identifier  = aws_subnet.eks_subnet.*.id
}
