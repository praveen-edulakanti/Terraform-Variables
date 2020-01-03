resource "aws_instance" "PublicInstance" {
	count = length(var.PublicInstances)
	 
	 ami = lookup(var.PublicInstances[count.index], "ami")
	 availability_zone = lookup(var.PublicInstances[count.index], "availability_zone")
	 instance_type = lookup(var.PublicInstances[count.index], "instance_type")
	 key_name = lookup(var.PublicInstances[count.index], "key_name")
	 #subnet_id = aws_subnet.public_subnet.*.id[count.index]
	 subnet_id = aws_subnet.public_subnet.*.id[count.index]
	 associate_public_ip_address = lookup(var.PublicInstances[count.index], "associate_public_ip_address")
	 user_data = file(lookup(var.PublicInstances[count.index], "user_data"))
	 #vpc_security_group_ids = [aws_security_group.PublicSecurityGrp.*.id[count.index]]
	 vpc_security_group_ids = [aws_security_group.PublicSecurityGrp.id]
	 
	tags = {
		Name = lookup(var.PublicInstances[count.index], "name")
		Environment = var.environment
		Terraform = true
	}
}

resource "aws_instance" "PrivateInstance" {
	count = length(var.PrivateInstances)
	 
	 ami = lookup(var.PrivateInstances[count.index], "ami")
	 availability_zone = lookup(var.PrivateInstances[count.index], "availability_zone")
	 instance_type = lookup(var.PrivateInstances[count.index], "instance_type")
	 key_name = lookup(var.PrivateInstances[count.index], "key_name")
	 #subnet_id = aws_subnet.private_subnet.*.id[count.index]
	 subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
	 associate_public_ip_address = lookup(var.PrivateInstances[count.index], "associate_public_ip_address")
	 user_data = file(lookup(var.PrivateInstances[count.index], "user_data"))
	 #vpc_security_group_ids = [aws_security_group.PrivateSecurityGrp.*.id[count.index]]
	 vpc_security_group_ids = [aws_security_group.PrivateSecurityGrp.id]
	 
	tags = {
		Name = lookup(var.PrivateInstances[count.index], "name")
		Environment = var.environment
		Terraform = true
	}
}