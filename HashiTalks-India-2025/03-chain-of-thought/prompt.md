Review the Terraform configuration in @03-chain-of-thought and reason step-by-step which parts of this setup can be optimized for scalability and cost.
Explain your reasoning clearly, then refactor the Terraform code to:

Use variable-driven instance types

Add auto-scaling support using aws_autoscaling_group

Add an output block to expose the public DNS of the web instance or load balancer
After reasoning, show the updated Terraform code.