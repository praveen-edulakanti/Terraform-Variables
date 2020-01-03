variable "aws_region" {
    type = string
}

variable "environment" {
    type = string
}

variable "vpc_name" {
    type = string
}

variable "vpc_cidr" {
    type = string
}

variable "public_subnets" {
    type = list
}

variable "private_subnets" {
	type = list
}

variable "igw_name" {
    type = string
}

variable "EIPs" {
	type = list
} 

variable "NATGateways" {
	type = list
} 

variable "PublicRT" {
	type = string
} 

variable "PrivateRTs" {
	type = list
}

variable "PublicInstances" {
	type  = list
} 

variable "PrivateInstances" {
	type  = list
}

variable "PublicSecurityGrp_ingress" {
	type  = list
} 

variable "PublicSecurityGrp_egress" {
	type  = list
}

variable "PrivateSecurityGrp_ingress" {
	type  = list
}

variable "PrivateSecurityGrp_egress" {
	type  = list
}

variable "LoadBalSecurityGrp_ingress" {
	type  = list
}

variable "LoadBalSecurityGrp_egress" {
	type  = list
}

variable "TargetGroupNames" {
	type  = list
}

variable "AlbForwardRules" {
	type  = list
}

variable "Route53zone_id" {
	type = string
} 

variable "domain_name" {
	type = string
} 

variable "www_domain_name" {
	type = string
}

variable "Route53AliasName" {
	type = string
}

