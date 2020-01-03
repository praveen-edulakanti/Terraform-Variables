resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnets)
    vpc_id     = aws_vpc.vpc.id
    cidr_block = lookup(var.public_subnets[count.index], "cidr_block")
    availability_zone = lookup(var.public_subnets[count.index], "availability_zone")
  
    tags = {
         Name = lookup(var.public_subnets[count.index], "name")
         Environment = var.environment
         Terraformed = "True"
    }
}

resource "aws_subnet" "private_subnet" { 
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.vpc.id
  cidr_block = lookup(var.private_subnets[count.index], "cidr_block")
  availability_zone = lookup(var.private_subnets[count.index], "availability_zone")
  
  tags = {
		Name = lookup(var.private_subnets[count.index], "name")
		Environment = var.environment
		Terraformed = "True"
  }
}