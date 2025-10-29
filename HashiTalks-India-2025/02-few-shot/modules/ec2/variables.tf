variable "name" {
  description = "Name for the EC2 resources"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the instance. If null, Amazon Linux 2023 latest will be used."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "create_security_group" {
  description = "Whether to create a security group"
  type        = bool
  default     = true
}

variable "security_group_ids" {
  description = "List of existing security group IDs to attach instead of creating one"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "List of ingress rule objects for the created security group"
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
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script to run on instance boot"
  type        = string
  default     = null
}

variable "tags" {
  description = "Common tags to apply to resources"
  type        = map(string)
  default     = {}
}


