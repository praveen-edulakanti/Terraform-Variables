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
output "PublicSubnet1" {
    value = aws_subnet.public_subnet[0].id
}
output "PublicSubnet2" {
    value = aws_subnet.public_subnet[1].id
}
output "PublicInstance1" {
    value = aws_instance.PublicInstance[0].id
}
output "PublicInstance2" {
    value = aws_instance.PublicInstance[1].id
}
output "PrivateSubnet1" {
    value = aws_subnet.private_subnet[0].id
}
output "PrivateSubnet2" {
    value = aws_subnet.private_subnet[1].id
}
output "PrivateInstance1" {
    value = aws_instance.PrivateInstance[0].id
}
output "PrivateInstance2" {
    value = aws_instance.PrivateInstance[1].id
}