resource "aws_security_group" "kubernetes-sg" {
  name        = "kubernetes-sg"
  description = "Kubernetes security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

