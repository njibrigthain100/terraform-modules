output "customer-security-group" {
  value = [aws_security_group.customer-security-group.id]
}