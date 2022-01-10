variable "name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "allowed_cidrs" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
