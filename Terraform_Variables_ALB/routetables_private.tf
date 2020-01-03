resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.vpc.id
  count  = length(var.NATGateways)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id  = aws_nat_gateway.NATGateway.*.id[count.index]
	#gateway_id = element(aws_nat_gateway.NATGateway.*.id, count.index)
  }

  tags = {
    Name = lookup(var.PrivateRTs[count.index], "name")
	Environment = var.environment
	Terraformed = "True"
  }
}

resource "aws_route_table_association" "PrivateRTAssociation" {
  count = length(var.private_subnets)
  subnet_id     = element(aws_subnet.private_subnet.*.id,count.index)
  route_table_id = element(aws_route_table.PrivateRT.*.id,count.index)
}