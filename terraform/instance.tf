
# Define the EC2 instance resource
resource "aws_instance" "kubernetes_instance" {
  ami           = "ami-03a6eaae9938c858c" # Replace with your desired AMI ID
  instance_type = "t2.micro"             # Replace with your desired instance type

  # Associate the security group and key pair with the instance
  vpc_security_group_ids = [aws_security_group.kubernetes-sg.id]
  key_name              = aws_key_pair.kubernetes-keypair.key_name

  # You can customize other instance attributes like user data, tags, etc. here
}

