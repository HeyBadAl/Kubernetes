resource "aws_key_pair" "kubernetes-keypair" {
  key_name   = "kubernetes-keypair"
  public_key = file("~/.ssh/id_rsa.pub") 
}

