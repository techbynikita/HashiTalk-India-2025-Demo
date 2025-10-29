# Chain-of-Thought Prompting Demo
# Terraform configuration demonstrating chain-of-thought debugging and optimization

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Add your resources here

