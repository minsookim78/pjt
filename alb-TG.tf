
#alb-TG.tf :로드발란서 타겟그룹생성

resource "aws_alb_target_group" "hholic-east-frontend" {
name = "hholic-east-frontend-TG"
port = 80
protocol = "HTTP"
vpc_id = aws_vpc.east-vpc.id
health_check {
interval = 30
path = "/"
healthy_threshold = 3
unhealthy_threshold = 3
}
tags = { Name = "Frontend Target Group" }
}

#resource "aws_alb_target_group_attachment" "frontend" {
#target_group_arn = "${aws_alb_target_group.user05-frontend.arn}"
#target_id = "${aws_instance.user05_ec2_1a.id}"
#port = 80
#}
#resource "aws_alb_target_group_attachment" "frontend_1c" {
#target_group_arn = "${aws_alb_target_group.user05-frontend.arn}"
#target_id = "${aws_instance.user05_EC2_1c.id}"
#port = 80
#}