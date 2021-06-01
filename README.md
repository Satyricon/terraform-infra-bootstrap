# Run the following steps to setup Terraform automation resources

1. Clone the repository - `git clone https://github.com/Satyricon/terraform-infra-bootstrap.git`
2. Login and set target Azure subscription - `az login`, `az account set --subscription SUBSCRIPTION_ID`
3. Setup connection to Azure DevOps Organization
  * login to your Azure DevOps Organization
  * Create Personal Access Token with Agent Pools (Read & manage) scope
  * Add to your .bashrc or .zshrc file the follwong environment variables
    * `export AZDO_ORG_SERVICE_URL=https://dev.azure.com/ORG_NAME`
    * `export AZDO_PERSONAL_ACCESS_TOKEN=PAT_TOKEN_FROM_ADO`
    * `export TF_VAR_azure_dev_ops_pat=PAT_TOKEN_FROM_ADO`
4. Initialize Terraform - `terraform init`
5. Create `.tfvars` file for your target environment under `vars/` directory
6. Run Terraform plan with corresponding tfvars file - `terraform plan -var-file vars/faug_demo.tfvars`. Check the output
7. Apply Terraform project - `terraform apply -var-file vars/faug_demo.tfvars`
8. Save the outputs
9. Check created resources through Azure Portal