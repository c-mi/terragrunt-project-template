output "route_table_id" {
  value = aws_ec2_transit_gateway_route_table.this.id
}

output "route_table_arn" {
  value = aws_ec2_transit_gateway_route_table.this.arn
}
