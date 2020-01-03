
resource "aws_eip" "EIP" {
    vpc   = true
	count = length(var.EIPs)
	
	tags = {
        Name = lookup(var.EIPs[count.index],"name")
        Environment = var.environment
        Terraformed = "True"
    }
}

resource "aws_nat_gateway" "NATGateway" {
  count = length(var.EIPs)
  allocation_id = aws_eip.EIP.*.id[count.index]
  subnet_id     = aws_subnet.public_subnet.*.id[count.index]
  
  #allocation_id = element(aws_eip.EIP.*.id, count.index)
  #subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)
  
  tags = {
    Name = lookup(var.NATGateways[count.index], "name")
	Environment = var.environment
	Terraformed = "True"
  }
}