# infra-kitchen

This repository contains the infrastructure manifests required to deploy Kubernetes on EKS for Tech Challenge 3.

## Requirements and Environment Setup

This infrastructure uses an AWS Academy account (which has limited resources and each session lasts 4 hours). Follow these steps to set up your environment:

1. Start the lab and obtain the credentials from AWS Academy.
2. Click the **AWS Details** button, then press the **AWS CLI** button to display the credentials.
3. Copy and paste the credentials content directly into your terminal in the directory `~/.aws/credentials`.
4. Update the `Settings > Variable Set` option on [HCP infra-kitchen workspaces](https://app.terraform.io/app/tc_fiap/workspaces) with the AWS credentials values: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_SESSION_TOKEN`.

### Commands used to check local updates

- `terraform init` - command used to initializing terraform in our local directory;
- `terraform fmt` - formats the .tf files by correcting indentation;
- `terraform validate` - checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state
- `terraform plan` - used do creates the execution plan to preview the changes in the provider infrastructure.

## HCP integration

This infrastructure is provisioned using [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs), which manages Terraform runs in a consistent environment. It facilitates collaboration by allowing team members to share access and iterate on the Terraform state easily. Each collaborator must have an account on the platform to contribute effectively.

## Continuous Integration
### TF Lint Checks

This repository includes linter checks to ensure the integrity of the IaC codebase. These checks are integrated with GitHub Actions and run on every commit.

![alt text](/docs/images/tflint.png)