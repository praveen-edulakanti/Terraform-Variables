resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.InternetGateway.id
  }

  tags = {
    Name = var.PublicRT
	Environment = var.environment
	Terraformed = "True"
  }
}

resource "aws_route_table_association" "PublicRTAssociation" {
  count = length(var.public_subnets)
  subnet_id     = element(aws_subnet.public_subnet.*.id,count.index)
  route_table_id = aws_route_table.PublicRT.id
}