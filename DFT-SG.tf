#DFT-SG.tf 기본 시큐리티 그룹 생성

resource "aws_default_security_group" "esat-vpc_SG_DFT" {
    vpc_id= aws_vpc.east-vpc.id
        ingress {
            protocol = -1
            self = true
            from_port = 0
            to_port = 0
            }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            }
    tags = {
        Name = "esat-vpc_SG_DFT"
            }
        }

resource "aws_default_security_group" "west-vpc_SG_DFT" {
    provider =aws.califonia
    vpc_id= aws_vpc.west-vpc.id
        ingress {
            protocol = -1
            self = true
            from_port = 0
            to_port = 0
            }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            }
    tags = {
        Name = "west-vpc_SG_DFT"
            }
        }