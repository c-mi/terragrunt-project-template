variable "transit_gateway_id" {
  type = string
}

variable "transit_gateway_attachment_id" {
  type = string
}

variable "transit_gateway_propagated_attachments" {
  type    = list(string)
  default = []
}

variable "name" {
  type = string
}
