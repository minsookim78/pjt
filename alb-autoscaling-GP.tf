#alb-autoscaling-GP.tf


resource "aws_autoscaling_group" "east-web" {
  name = "${aws_launch_configuration.east-web.name}-asg"

  min_size             = 1
  desired_capacity     = 2
  max_size             = 3

  health_check_type    = "ELB"
  #load_balancers= ["${aws_alb.alb.id}" ] #classic
  target_group_arns   = ["${aws_alb_target_group.hholic-east-frontend.arn}"]
  #alb = "${aws_alb.alb.id}"
  
  launch_configuration = "${aws_launch_configuration.east-web.name}"
  ####  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]  아ㅐㄹ vpc_zone_identifier 와 중복

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity="1Minute"

  vpc_zone_identifier  = [
       "${aws_subnet.east-1-public_1a.id}",
       "${aws_subnet.east-1-public_1c.id}"
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "east-web-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "east-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.east-web.id
  alb_target_group_arn   = aws_alb_target_group.hholic-east-frontend.arn
}