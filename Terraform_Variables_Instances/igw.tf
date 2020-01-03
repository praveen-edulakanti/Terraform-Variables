resource "aws_internet_gateway" "InternetGateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
	Environment = var.environment
	Terraformed = "True"
  }
  
}