data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

locals {
  effective_ami_id = var.ami_id != null && var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux.id
}

resource "aws_security_group" "this" {
  count       = var.create_security_group ? 1 : 0
  name        = var.name
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = lookup(ingress.value, "description", null)
      from_port        = lookup(ingress.value, "from_port", 0)
      to_port          = lookup(ingress.value, "to_port", 0)
      protocol         = lookup(ingress.value, "protocol", "tcp")
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", ["0.0.0.0/0"])
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", ["::/0"])
    }
  }

  tags = merge({
    Name = var.name
  }, var.tags)
}

locals {
  sg_ids = length(var.security_group_ids) > 0 ? var.security_group_ids : (var.create_security_group ? [aws_security_group.this[0].id] : [])
}

resource "aws_instance" "this" {
  ami                         = local.effective_ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip
  key_name                    = var.key_name

  vpc_security_group_ids = local.sg_ids

  user_data = var.user_data

  tags = merge({
    Name = var.name
  }, var.tags)
}


