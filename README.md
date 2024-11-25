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
- `terraform validate` - checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state;
- `terraform plan` - used do creates the execution plan to preview the changes in the provider infrastructure;

## HCP integration

This infrastructure is provisioned using [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs), which manages Terraform runs in a consistent environment. It facilitates collaboration by allowing team members to share access and iterate on the Terraform state easily. Each collaborator must have an account on the platform to contribute effectively.

### Plan and Apply flows

Every push to the repository triggers a `terraform plan` to preview the changes in the infrastructure. After a merge, another `terraform plan` is executed followed by a `terraform apply` to implement the changes. You can follow these actions by clicking on the GitHub checks, which will redirect you to the HCP platform for detailed logs and status updates.

#### How to: provisioning the all infra on EKS

### Tutorial: Provisioning the Entire Infrastructure on EKS

1. **Create a Pull Request and Merge:**
    - Update the environment values on HCP and locally.
    - Create a PR on this repository and merge it into the main branch. This action will trigger a `terraform plan` and `terraform apply`.
    - You can follow the entire process on [infra-kitchen runs](https://app.terraform.io/app/tc_fiap/workspaces/infra-kitchen/runs). Note that it takes at least 15 minutes for the infrastructure to be up and running.

![alt text](/docs/images/hcp-run.png)

2. **Get the Kubeconfig:**
    - After the infrastructure is up, use the following commands to get the kubeconfig:

```bash
    aws eks --region us-east-1 update-kubeconfig --name EKS-lanchonete-cluster

    kubectl cluster-info
    ❯ kubectl cluster-info
    Kubernetes control plane is running at https://8A378062CC9AEEE22CD23D0F97BDBAF3.gr7.us-east-1.eks.amazonaws.com
    CoreDNS is running at https://8A378062CC9AEEE22CD23D0F97BDBAF3.gr7.us-east-1.eks.amazonaws.com/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

    To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```
3. **Deploy Kubernetes objects:**
    - Go to [app service repository](https://github.com/software-architecture-fiap/tech-challenge) and try to apply the manifests from there.
    - Export 
    ```
    ```


#### Destroy and Deletion Flows

For security reasons, deletion operations must be scheduled or triggered directly from the HCP workspace settings. This ensures that only authorized personnel can initiate such critical actions, preventing accidental or malicious deletions. Follow these steps to perform a deletion:

1. Navigate to the [HCP infra-kitchen workspace](https://app.terraform.io/app/tc_fiap/workspaces).
2. Go to the **Settings** tab.
3. Select **Destruction and Deletion** from the menu.
4. Schedule or trigger the deletion as required.

Ensure you have the necessary permissions to perform these actions and use them carefully.

### Repository ruleset

<!-- TODO -->

## Continuous Integration
### TF Lint Checks

This repository includes linter checks to ensure the integrity of the IaC codebase. These checks are integrated with GitHub Actions and run on every commit.

![alt text](/docs/images/tflint.png)