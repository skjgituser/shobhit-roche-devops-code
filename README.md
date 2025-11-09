**Project: CI/CD Pipeline for Terraform and Ansible Automation**
**Objective:**
To build a fully automated CI/CD pipeline that provisions AWS infrastructure using Terraform, configures it using Ansible, and manages the entire workflow through GitHub Actions runners.

**Detailed Steps and Workflow**
**1.Configured CI/CD Workflow:**
  Created a ci.yaml file under .github/workflows/ directory to define automated pipeline jobs.
  Each job triggers a GitHub runner (worker) to perform the required tasks such as provisioning, configuration, and cleanup.
**2.Source Code Checkout:**
  The first job begins by cloning the project repository from GitHub into the runner environment using the actions/checkout@v3 action.
  This ensures all Terraform and Ansible files are available locally for execution.
**3.Install Terraform on Runner:**
  Installed Terraform using shell commands in the runner to enable Infrastructure as Code execution.
  Verified installation using terraform --version.
**4.Configure AWS Credentials:**
  Connected the runner to the AWS account using Access Key ID and Secret Access Key stored securely in the GitHub repository’s secrets section.
  Configured AWS credentials using environment variables or AWS CLI commands (aws configure).
  Verified access using aws sts get-caller-identity.
**5.Provision Infrastructure (Terraform Apply):**
  Initialized Terraform with terraform init to download required providers and modules.
  Validated configurations using terraform validate.
  Executed terraform apply -auto-approve to create AWS EC2 instances as defined in the .tf files (VPC, subnets, security groups, instances, etc.).
**6.Generate and Upload Inventory File:**
  Extracted instance public IPs from Terraform output using terraform output.
  Generated an Ansible inventory file containing those IP addresses and connection details (e.g., SSH user, key).
  Uploaded this inventory file as a GitHub Actions artifact for later stages using the actions/upload-artifact@v3 action.
**7.Trigger Configuration Job (Job 2):**
  The second job runs after successful infrastructure provisioning.
  It starts a new runner and downloads the project code again from GitHub.
**8.Download Inventory Artifact:**
  Used actions/download-artifact@v3 to retrieve the previously uploaded inventory file.
  Verified that the file contains the correct IPs of the created instances.
**9.Install and Configure Ansible:**
  Installed Ansible on the runner using sudo apt install ansible -y.
  Verified installation with ansible --version.
  Configured Ansible with the downloaded inventory file to define target hosts.
**10.Execute Ansible Playbook:**
  Ran ansible-playbook commands to perform remote configuration on the EC2 instances.
  The playbook installed essential packages such as Git and Apache HTTPD.
  Used SSH connection details from the inventory file for secure access.
**11.Trigger Cleanup Job (Job 3):**
  Created a third job in the pipeline to handle infrastructure cleanup after deployment and configuration are complete.
  The job initiates another runner and clones the GitHub repository again.
**12.Install Terraform and Connect AWS (Cleanup Stage):**
  Installed Terraform on the cleanup runner and reconfigured AWS credentials (same as in Step 4).
  Ensured all .tf files were accessible from the cloned repository.
**13.Destroy Infrastructure:**
  Executed terraform destroy -auto-approve to tear down all AWS resources created during the pipeline.
  Confirmed that all instances and related infrastructure were successfully removed from AWS.
**14.Pipeline Completion:**
  Validated that all three jobs (provision → configure → destroy) ran successfully in sequence.
  Verified that artifacts were properly passed between jobs.
  Documented the process and results for reusability in future projects.

**Outcome:**
Successfully automated end-to-end infrastructure provisioning, configuration, and teardown using Terraform, Ansible, AWS, and GitHub Actions.
Gained strong understanding of:
CI/CD workflow design in GitHub Actions
Infrastructure as Code (IaC) with Terraform
Configuration Management using Ansible
Secure AWS integrations using GitHub secrets
Artifact handling and multi-stage pipeline execution

    
