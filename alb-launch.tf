#alb-launch.tf

resource "aws_launch_configuration" "east-web" {
  name_prefix = "east-autoscaling-web"

  image_id = var.amazon_linux_east
  instance_type = "t2.nano"
  key_name = "Hholic"
  security_groups = [
    "${aws_security_group.east-alb-SG.id}",
    "${aws_default_security_group.esat-vpc_SG_DFT.id}",
  ]
  associate_public_ip_address = true
    
  user_data = <<USER_DATA
#!/bin/bash
yum update
yum -y install httpd
echo "<html>" > /var/www/html/index.html
echo "Hello" >> /var/www/html/index.html
echo "<img src=\"CloudFront URL\"> >> /var/www/html/index.html"
echo "</html>" >> /var/www/html/index.html
systemctl start httpd.service
systemctl enable httpd.service
  USER_DATA

  lifecycle {
    create_before_destroy = true
  }
}
