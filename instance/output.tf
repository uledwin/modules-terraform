output "instance_ip" {
  value = aws_instance.instance-platzi.*.public_ip

}