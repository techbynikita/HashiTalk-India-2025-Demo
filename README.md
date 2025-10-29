# 🚀 HashiTalks India 2025 — AI-Powered Terraform Workflows

> **Talk Title:** *Infra-as-Code Meets Prompt Engineering: AI-Powered Terraform Workflows*  
> **Speaker:** **Nikita Mourya** — Staff Cloud Platform Engineer @ AppDirect  
> **Event:** HashiTalks India 2025  
> **Duration:** 30 mins | Includes Live Demo 🎥  

---

## 🌩️ Overview

This demo explores how **Prompt Engineering + AI-powered tools** like **Cursor IDE** are transforming how we write, debug, and manage Terraform.

We'll move from **manual IaC** ➜ **AI-assisted workflows**, showing how prompts can generate, modularize, and even troubleshoot Terraform code — in seconds.

---

## 🗣️ Talk Abstract

**Infra-as-Code Meets Prompt Engineering: AI-Powered Terraform Workflows**

As AI tools rapidly evolve, they're transforming how we approach infrastructure—making it faster, more accessible, and intelligent. In this session, I’ll explore how Prompt Engineering can be applied to generate, optimize, and troubleshoot Terraform code using modern AI tools.

We'll walk through the fundamentals of prompt engineering—like zero-shot, few-shot, and chain-of-thought prompting—and how these techniques can be used with open-source or publicly available AI assistants to build real-world Terraform configurations. Whether it's generating boilerplate modules, adding tagging standards, or refactoring existing code, you’ll see how prompts can drive productivity and accelerate learning for DevOps and Cloud Engineers.

This talk includes a live demo of generating Terraform with prompts using AI tools, and practical insights from recent PoCs to show what works, what doesn’t, and where AI is heading in the world of IaC.

If you're curious about how to integrate AI into your infrastructure workflow—or just want a smarter way to write Terraform—this session is for you.

---

## 🧠 Key Learning Objectives

By the end of this demo, you'll learn how to:

✅ Use **Zero-Shot prompting** to generate Terraform code from pure intent.  
✅ Apply **Few-Shot prompting** to enforce team-wide tagging and module standards.  
✅ Leverage **Chain-of-Thought prompting** to debug and optimize Terraform intelligently.  
✅ Use **Cursor's Agent & Plan modes** to automate and validate IaC development.  
✅ Understand how AI complements DevOps — it doesn't replace it.

---

## 📋 Prerequisites

Before following along with this demo, ensure you have:

- **Terraform** >= 1.0 installed ([Download](https://www.terraform.io/downloads))
- **AWS CLI** configured with credentials ([Setup Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html))
- **Cursor IDE** installed ([Download](https://cursor.sh/))
- **Git** installed and configured
- Basic familiarity with Terraform concepts

---

## ⚙️ Demo Flow

The following directory structure is used for the live session:

```
HashiTalk-India-2025-Demo/
├── .gitignore              # Terraform & credential exclusions
├── README.md               # This file
├── modules/                # Reusable Terraform modules
│   ├── ec2/
│   ├── s3/
│   └── vpc/
├── examples/               # Example configurations
│   ├── zero-shot/          # Zero-Shot prompting examples
│   ├── few-shot/           # Few-Shot prompting examples
│   └── chain-of-thought/   # Chain-of-Thought examples
└── environments/           # Environment-specific configs
    ├── dev/
    └── prod/
```

### Demo Steps:

1. **Zero-Shot Prompting** 🎯
   - Generate Terraform code from natural language requirements
   - Create AWS resources using AI-powered prompts
   - No prior examples needed — pure intent to code

2. **Few-Shot Prompting** 📚
   - Show examples of best practices
   - Enforce consistent tagging strategies
   - Build reusable modules with AI assistance

3. **Chain-of-Thought Prompting** 🔍
   - Debug terraform plan errors intelligently
   - Optimize resource configurations
   - Generate explanations for complex changes

4. **Cursor IDE Integration** 🤖
   - Use Agent mode for multi-file changes
   - Leverage Plan mode for code review
   - Automate Terraform workflow validation

---

## 🛠️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/techbynikita/HashiTalk-India-2025-Demo.git
cd HashiTalk-India-2025-Demo
```

### 2. Configure AWS Credentials

```bash
# Option 1: AWS CLI configure (recommended)
aws configure

# Option 2: Environment variables
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

**⚠️ Important:** Never commit your AWS credentials! Use environment variables, AWS CLI profiles, or AWS IAM roles.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Open in Cursor IDE

Open the repository in Cursor IDE to experience the AI-powered workflows demonstrated in the talk.

---

## 💡 Usage Examples

### Zero-Shot Example

**Prompt:**
> "Create an S3 bucket with versioning enabled, server-side encryption, and public read access"

**Expected Output:**
```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.example.arn}/*"
    }]
  })
}
```

---

## 📝 Best Practices Demonstrated

- **Modular Design:** Reusable Terraform modules
- **Security First:** Credential management via `.gitignore`
- **AI-Assisted Development:** Leveraging Cursor IDE capabilities
- **Version Control:** Proper Git workflow with meaningful commits
- **Documentation:** Clear README and inline comments

---

## 🔗 Resources & Links

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Cursor IDE](https://cursor.sh/)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [HashiCorp Learn](https://learn.hashicorp.com/)

---

## 📧 Contact & Questions

**Speaker:** Nikita Mourya  
**Email:** techbynikita7@gmail.com  
**GitHub:** [@techbynikita](https://github.com/techbynikita)  
**Twitter/X:** [@techbynikita](https://twitter.com/techbynikita)

---

## 📄 License

This repository is intended for educational purposes as part of HashiTalks India 2025. Feel free to fork, modify, and use for your own learning and projects.

---

**Built with ❤️ using Terraform and AI-powered development tools**
