resource "aws_instance" "kubernetes_instance" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"             

  vpc_security_group_ids = [aws_security_group.kubernetes-sg.id]
  key_name              = aws_key_pair.kubernetes-keypair.key_name

}

