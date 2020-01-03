output "region" {
    value = var.aws_region
}
output "environment" {
    value = var.environment
}
output "vpc_name" {
    value = var.vpc_name
}
output "vpc_ip" {
    value = var.vpc_cidr
}
output "vpc_id" {
    value = aws_vpc.vpc.id
}
output "PublicInstance_ids" {
    value = aws_instance.PublicInstance.*.id
}
/*output "PublicInstance2" {
    value = aws_instance.PublicInstance[1].id
}*/
output "publicsubnet_ids" {
	value = aws_subnet.public_subnet.*.id
}
output "privatesubnet_ids" {
    value = aws_subnet.private_subnet.*.id
}
output "PrivateInstance_ids" {
    value = aws_instance.PrivateInstance.*.id
}

/*output "Listener443" {
    value = aws_lb_listener.Listener443.arn
}*/
