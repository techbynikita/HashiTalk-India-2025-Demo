# Zero-Shot Prompting Demo
# Terraform configuration will be generated here using AI prompts

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

locals {
  # Use account ID and timestamp in bucket name to ensure global uniqueness
  bucket_name = lower("hashitalks-zs-${replace(var.aws_account_id, "_", "-")}-${formatdate("YYYYMMDDhhmmss", timestamp())}")
}

variable "aws_account_id" {
  description = "Your AWS account ID used to help make unique names"
  type        = string
  default     = "029930584745"
}

resource "aws_s3_bucket" "zero_shot_demo" {
  bucket = local.bucket_name

  tags = {
    Project     = "HashiTalks-India-2025"
    Demo        = "Zero-Shot"
    Owner       = "Nikita-Mourya-AWSUG"
    Environment = "demo"
  }
}

resource "aws_s3_bucket_versioning" "zero_shot_demo" {
  bucket = aws_s3_bucket.zero_shot_demo.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.zero_shot_demo.bucket
  description = "The created S3 bucket name"
}

