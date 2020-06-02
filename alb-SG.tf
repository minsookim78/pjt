#alb-SG.tf :어플리케이션 로드발란서용 시큐리티 그룹 생성
resource "aws_security_group" "east-alb-SG" {
    name = "esat-alb-SG"
    description = "open HTTP port for ALB"
    vpc_id = aws_vpc.east-vpc.id
    
        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                }
          ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
                }
    tags = {
        Name = "east-alb-SG"
            }
}

resource "aws_security_group" "west-alb-SG" {
    provider = aws.califonia
    name = "west-alb-SG"
    description = "open HTTP port for ALB"
    vpc_id = aws_vpc.west-vpc.id

        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                }
          ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
                }
    tags = {
        Name = "west-alb-SG"
            }
}