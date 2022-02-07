variable "aws_ami_id" {
  default     = ""
  description = "Ami ID"
}

variable "aws_instance_type" {
}

variable "aws_tags" {
  type = map(any)

}

variable "aws_sg_name" {

}

variable "aws_sg_ingress_rule" {

}