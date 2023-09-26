

# Create an EC2 key pair 
resource "aws_key_pair" "kubernetes-keypair" {
  key_name   = "kubernetes-keypair"
  public_key = file("~/.ssh/id_rsa.pub") # Provide the path to your public key file
}

