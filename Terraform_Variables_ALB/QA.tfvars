#terraform plan -var-file="QA.tfvars"
environment = "QA"
aws_region = "ap-south-1"
vpc_name = "QA_VPC"
vpc_cidr = "10.1.0.0/16"

public_subnets = [
	{
		name ="PublicSubnet1a"
		cidr_block = "10.1.1.0/24"
		availability_zone = "ap-south-1a"
		#map_public_ip_on_launch = true
	},
	{
        name ="PublicSubnet1b"	
		cidr_block = "10.1.2.0/24"
		availability_zone = "ap-south-1b"
		#map_public_ip_on_launch = true
	}
]

private_subnets = [
	{
	  name = "PrivateSubnet1a"
	  cidr_block = "10.1.3.0/24"
	  availability_zone = "ap-south-1a"
	  map_public_ip_on_launch = false
	},
	{
	  name = "PrivateSubnet1b"
	  cidr_block = "10.1.4.0/24"
	  availability_zone = "ap-south-1b"
	  map_public_ip_on_launch = false
	}
	
]

igw_name = "InternetGateway"

EIPs = [
	{
	  name = "EIP1a"
	},
	{
	  name = "EIP1b"
	}	
]

NATGateways = [
   	{
	  name = "NATGateway1a"
	},
	{
	  name = "NATGateway1b"
	}	
] 

PublicRT = "PublicRT"

PrivateRTs = [
	{
		cidr_private_route = "0.0.0.0/0"
		name = "PrivateSubnetRT1"
	},
	{
		cidr_private_route = "0.0.0.0/0"
		name = "PrivateSubnetRT2"
	}
]	

PublicInstances = [
	{
	  
	 name = "PublicInstance1a"
	 ami = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
	 availability_zone = "ap-south-1a"
	 instance_type = "t2.micro"
	 key_name = "terraform-demo"
	 associate_public_ip_address = true
	 user_data = "user-data-pub1.sh"
	
	},
	{
	  name = "PublicInstance1b"
	  ami = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
	  availability_zone = "ap-south-1b"
	  instance_type = "t2.micro"
	  key_name = "terraform-demo"
	  associate_public_ip_address = true
	  user_data = "user-data-pub2.sh"
	}
]

PrivateInstances = [
	{
	  
	 name = "PrivateInstance1a"
	 ami = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
	 availability_zone = "ap-south-1a"
	 instance_type = "t2.micro"
	 key_name = "terraform-demo"
	 associate_public_ip_address = false
	 user_data = "user-data-prv1.sh"
	
	},
	{
	  name = "PrivateInstance1b"
	  ami = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
	  availability_zone = "ap-south-1b"
	  instance_type = "t2.micro"
	  key_name = "terraform-demo"
	  associate_public_ip_address = false
	  user_data = "user-data-prv2.sh"
	}
]

PublicSecurityGrp_ingress = [
	{
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	},
	{
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	},
	{
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
]

PrivateSecurityGrp_ingress = [
	{
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	},
	{
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	},
	{
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
]

PublicSecurityGrp_egress = [
	{
	  from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
	}
]

PrivateSecurityGrp_egress = [
	{
	  from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
	}
]

LoadBalSecurityGrp_ingress = [
	{
	  # TLS (change to whatever ports you need)
	  from_port   = 80
	  to_port     = 80
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	},
	{
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
]

LoadBalSecurityGrp_egress  = [
	{
	  from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
	}
]

TargetGroupNames = [
	{
		name  = "User-Service"
	},
	{
	   name   = "Dashboard-Service"
	}
]

AlbForwardRules = [
	{
		  name = "user"
		  priority  = 90
		  type = "forward"
		  field = "path-pattern"
		  values = "/user*"
	},
	{
		  name = "dashboard"
		  priority  = 100
		  type = "forward"
		  field = "path-pattern"
		  values = "/dashboard*"
	}
]

Route53zone_id = "Z24SDMK7FWJ00J"
domain_name = "edulakanti.info"
www_domain_name = "www.edulakanti.info"
Route53AliasName = "LoadBalancer"