variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Name for the EC2 instance and related resources"
  type        = string
  default     = "cot-demo-ec2"
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance"
  type        = string
}

variable "ami_id" {
  description = "Optional AMI override; if null, module chooses Amazon Linux 2023"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "associate_public_ip" {
  description = "Associate a public IP with the instance"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "EC2 key pair name for SSH"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = null
}

variable "create_security_group" {
  description = "Whether to create a security group for the instance"
  type        = bool
  default     = true
}

variable "security_group_ids" {
  description = "Existing security group IDs to attach instead of creating one"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "Ingress rules for the created security group"
  type = list(object({
    description      = optional(string)
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string), ["0.0.0.0/0"])
    ipv6_cidr_blocks = optional(list(string), ["::/0"])
  }))
  default = [
    {
      description      = "SSH",
      from_port        = 22,
      to_port          = 22,
      protocol         = "tcp",
      cidr_blocks      = ["0.0.0.0/0"],
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}

variable "tags" {
  description = "Tags to apply to resources via the module"
  type        = map(string)
  default = {
    cost_center = "1235"
    env         = "Prod"
  }
}


