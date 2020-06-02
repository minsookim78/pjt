#autoscale-alb.tf
resource "aws_alb" "hholic-east-alb" {
    name = "hholic-east-alb-autoscaling"
    internal = false
    security_groups = ["${aws_security_group.east-alb-SG.id}"]
    subnets = [
       "${aws_subnet.east-1-public_1a.id}",
       "${aws_subnet.east-1-public_1c.id}"
    ]
    access_logs {
        bucket = "${aws_s3_bucket.hholic-alb-s3.id}"
        prefix = "frontend-alb"
        enabled = true
    }
    tags = {
        Name = "hholic-east--alb-autoscaling"
    }
    lifecycle { create_before_destroy = true }
}