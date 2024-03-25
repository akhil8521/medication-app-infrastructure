# medication-app-infrastructure

## Infrastructure Setup

1. **Terraform Initialization**
   
   Navigate to the `https://github.com/akhil8521/medication-app-infrastructure` directory and initialize the Terraform environment:
   ```sh
   cd medication-app-infrastructure/
   az login 
   terraform init
   ```

2. **Infrastructure Provisioning**

   Apply the Terraform configuration to provision the Azure resources:
   ```sh
   terraform apply
   ```
   
   Confirm the action by typing `yes` when prompted.
