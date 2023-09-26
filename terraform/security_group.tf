
# Define a security group for the EC2 instance
resource "aws_security_group" "kubernetes-sg" {
  name        = "kubernetes-sg"
  description = "Kubernetes security group for EC2 instance"

  # Define ingress rules (inbound traffic)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from anywhere (for demonstration purposes)
  }
}

