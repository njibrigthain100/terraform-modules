This readme.md file will explain how the terragrunt-class directory works. This directory is comprised of several modules for creating a 3 tier architectural environment. First we start with creating the network component (VPC, Subnet, IGW, Nat gateway etc). Then followed by the compute environment. Please see below on steps to getting this accomplished. 

Network: To create the network component for your environment follow the directions below

1. ```
   - cd /terragrunt-class/Networking
   - run terraform init (This initializes your repo). Please make sure to create your s3 bucket and dynamoDB table for all your state file storages. For information on how to create an s3 bucket or dyanmoDB table please refer to the below documnetations:
   https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html
   https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-1.html
   - terraform plan -var-file=variable/"tfvar file here" (This module provides you the ability to create several tfvar files for each of your aws environments. Here you can pass the values for all your required variables. You can also pass the profile for the account you will be running the code on)
   - terraform apply -var-file=variable/"tfvar file here". This applies all the changes on the coniguration file to your designated environment. 
   ```

Security group and Compute: This module creates both the security group (and all its ingress and egress rules) and the compute resources. To create the network resources please follow the steps listed below

1. ```
   - cd /terragrunt-class/Compute 
   - run terraform init (This initializes your repo)
   - run terraform plan -var-file=variable/"tfvars file here" (As with the case above this module allows you to create the resources in several envornments of your choice. The module is comprised of both the ec2 module and the security group module. Both of this modules are dependent on the above Network components so please remember to run the above code first before running this. The security group resources are created first as the compute resources will need the security group for their creation.)
   - run terraform apply -var-file=variable/"tfvars files here". The compute resources created are a single DB windows instance, 5 windows app servers, 2 linux app servers, 5 windows web servers, and 2 linux web servers. The app and DB servers will all be located in the private subnet while the web servers will be located in the public subnets.  
   ```
