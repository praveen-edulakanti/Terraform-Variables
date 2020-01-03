resource "aws_lb" "LoadBalancer" {
  name               = "LoadBalancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
  #subnets = publicsubnet_ids #We can get subnets from output file using variable.
  #split(aws_subnet.public_subnets,0,2)
  security_groups    = [aws_security_group.LoadBalSecurityGrp.id]

  enable_deletion_protection = false

  tags = {
    Name = "LoadBalancer"
	Environment = var.environment
    Terraformed = "True"
  }
}

resource "aws_lb_target_group" "TargetGroup" {
 
  count    = length(var.TargetGroupNames)
  name     = lookup(var.TargetGroupNames[count.index], "name")
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
 
  
  /*stickiness {
    enabled = false
    type = "lb_cookie"
  }*/
  
  tags = {
	Name= lookup(var.TargetGroupNames[count.index],"name")
	Environment = var.environment
    Terraformed = "True"
  }
}





resource "aws_lb_listener" "Listener80" {
  load_balancer_arn   = aws_lb.LoadBalancer.arn
  port                = 80
  protocol            = "HTTP"

  default_action {
    #type              = "forward"
    #target_group_arn  = aws_lb_target_group.HTTPGrp-User.arn
	
	type = "redirect"
	redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
	
  }
}


resource "aws_lb_listener" "Listener443" {
  load_balancer_arn = aws_lb.LoadBalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::863896359115:server-certificate/EdulakantiInfoCertificate"
  #certificate_arn   = " arn:aws:acm:ap-south-1:863896359115:certificate/13492c39-a0af-4d9d-a0da-9053c84b9227"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TargetGroup[1].arn
  }
}

resource "aws_lb_target_group_attachment" "https" {
  count = length(var.TargetGroupNames)
  target_group_arn = aws_lb_target_group.TargetGroup.*.arn[count.index]
  target_id        = aws_instance.PrivateInstance.*.id[count.index]
  #target_id         = element(split(",", join(",", aws_instance.PrivateInstance.*.id)), count.index)
  port             = 80
}


#Application Load Balancer
resource "aws_lb_listener_rule" "ForwardRulesLB" {
  count = length(var.AlbForwardRules)
  listener_arn  = aws_lb_listener.Listener443.arn
  priority      = lookup(var.AlbForwardRules[count.index], "priority")

  action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.TargetGroup.*.arn[count.index]
  }
  
  condition {
    field  =  lookup(var.AlbForwardRules[count.index], "field")
    values = [lookup(var.AlbForwardRules[count.index], "values")]
  }
}