resource "aws_security_group" "PublicSecurityGrp" {
  name        = "PublicSecurityGroup"
  description = "Allow Permission for Public Security Group inbound traffic"
  vpc_id      =  aws_vpc.vpc.id
  
  /*count = length(var.PublicSecurityGrp_ingress)

  ingress {
    from_port   = lookup(var.PublicSecurityGrp_ingress[count.index], "from_port")
    to_port     = lookup(var.PublicSecurityGrp_ingress[count.index], "to_port")
    protocol    = lookup(var.PublicSecurityGrp_ingress[count.index], "protocol")
    cidr_blocks = lookup(var.PublicSecurityGrp_ingress[count.index], "cidr_blocks")
  }*/
  
  ingress {
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  
  egress {
    from_port       = lookup(var.PublicSecurityGrp_egress[0], "from_port")
    to_port         = lookup(var.PublicSecurityGrp_egress[0], "to_port")
    protocol        = lookup(var.PublicSecurityGrp_egress[0], "protocol")
    cidr_blocks     = lookup(var.PublicSecurityGrp_egress[0], "cidr_blocks")
  }

  tags = {
    Name = "PublicSecurityGroup"
	Environment = var.environment
	Terraformed = "True"
  }
}

resource "aws_security_group" "PrivateSecurityGrp" {
  name        = "PrivateSecurityGroup"
  description = "Allow Permission for Private Security Group inbound traffic"
  vpc_id      =  aws_vpc.vpc.id

  /*count = length(var.PrivateSecurityGrp_ingress)

  ingress {
    from_port   = lookup(var.PrivateSecurityGrp_ingress[count.index], "from_port")
    to_port     = lookup(var.PrivateSecurityGrp_ingress[count.index], "to_port")
    protocol    = lookup(var.PrivateSecurityGrp_ingress[count.index], "protocol")
    cidr_blocks = lookup(var.PrivateSecurityGrp_ingress[count.index], "cidr_blocks")
  }*/
  
  ingress {
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  
  egress {
    from_port       =  lookup(var.PrivateSecurityGrp_egress[0], "from_port")
    to_port         =  lookup(var.PrivateSecurityGrp_egress[0], "to_port")
    protocol        =  lookup(var.PrivateSecurityGrp_egress[0], "protocol")
    cidr_blocks     =  lookup(var.PrivateSecurityGrp_egress[0], "cidr_blocks")
  }

  tags = {
    Name = "PrivateSecurityGroup"
	Environment = var.environment
	Terraformed = "True"
  }
}

resource "aws_security_group" "LoadBalSecurityGrp" {
  name        = "LoadBalSecurityGroup"
  description = "Allow Permission for Load Balancer Security Group inbound traffic"
  vpc_id      =  aws_vpc.vpc.id
  
  /*count = length(var.LoadBalSecurityGrp_ingress)

  ingress {
    from_port   = lookup(var.LoadBalSecurityGrp_ingress[count.index], "from_port")
    to_port     = lookup(var.LoadBalSecurityGrp_ingress[count.index], "to_port")
    protocol    = lookup(var.LoadBalSecurityGrp_ingress[count.index], "protocol")
    cidr_blocks = lookup(var.LoadBalSecurityGrp_ingress[count.index], "cidr_blocks")
  }*/
  
 ingress {
		# TLS (change to whatever ports you need)
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		# Please restrict your ingress to only necessary IPs and ports.
		# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
		cidr_blocks = ["0.0.0.0/0"]
		#add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
	  from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"]
	  #add your IP address here
	}
  ingress {
	  # TLS (change to whatever ports you need)
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      # Please restrict your ingress to only necessary IPs and ports.
      # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
      cidr_blocks = ["0.0.0.0/0"] # add your IP address here
	}
  
  egress {
    from_port       =  lookup(var.LoadBalSecurityGrp_egress[0], "from_port")
    to_port         =  lookup(var.LoadBalSecurityGrp_egress[0], "to_port")
    protocol        =  lookup(var.LoadBalSecurityGrp_egress[0], "protocol")
    cidr_blocks     =  lookup(var.LoadBalSecurityGrp_egress[0], "cidr_blocks")
  }

  tags = {
    Name = "LoadBalSecurityGroup"
	Environment = var.environment
	Terraformed = "True"
  }
}

/*
#Classic Load Balancer Security Section
resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  #cidr_blocks = "0.0.0.0/0"
  source_security_group_id = aws_security_group.LoadBalSecurityGrp.id
  security_group_id = aws_security_group.PrivateSecurityGrp.id
  
}*/

