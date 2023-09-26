provider "aws" {
  region = "us-east-1" # Change this to your desired region
}

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

# Create an EC2 key pair 
resource "aws_key_pair" "kubernetes-keypair" {
  key_name   = "kubernetes-keypair"
  public_key = file("~/.ssh/id_rsa.pub") # Provide the path to your public key file
}

# Define the EC2 instance resource
resource "aws_instance" "kubernetes_instance" {
  ami           = "ami-03a6eaae9938c858c" # Replace with your desired AMI ID
  instance_type = "t2.micro"             # Replace with your desired instance type

  # Associate the security group and key pair with the instance
  vpc_security_group_ids = [aws_security_group.kubernetes-sg.id]
  key_name              = aws_key_pair.kubernetes-keypair.key_name

  # You can customize other instance attributes like user data, tags, etc. here
}

# Output the public IP address of the created instance
output "instance_public_ip" {
  value = aws_instance.kubernetes_instance.public_ip
}

