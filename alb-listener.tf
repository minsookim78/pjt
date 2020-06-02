
#alb-listener.tf

resource "aws_alb_listener" "hholic-east-http" {
load_balancer_arn = "${aws_alb.hholic-east-alb.arn}"
port = "80"
protocol = "HTTP"
default_action {
target_group_arn = "${aws_alb_target_group.hholic-east-frontend.arn}"
type = "forward"
}
}

