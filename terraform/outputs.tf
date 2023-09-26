
# Output the public IP address of the created instance
output "instance_public_ip" {
  value = aws_instance.kubernetes_instance.public_ip
}


