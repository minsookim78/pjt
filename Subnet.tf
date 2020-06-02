#Subnet.tf : 서브넷 생성
resource "aws_subnet" "east-1-public_1a" {
vpc_id = aws_vpc.east-vpc.id
availability_zone = "us-east-1a"
cidr_block = "10.0.1.0/24"
tags = {
Name = "east-1-public-1a"
}
}

resource "aws_subnet" "east-1-public_1c" {
vpc_id = aws_vpc.east-vpc.id
availability_zone = "us-east-1c"
cidr_block = "10.0.2.0/24"
tags = {
Name = "east-1-public-1c"
}
}

resource "aws_subnet" "west-1-public_1a" {
provider = aws.califonia
vpc_id = aws_vpc.west-vpc.id
availability_zone = "us-west-1a"
cidr_block = "20.0.1.0/24"
tags = {
Name = "west-1st-1-public-1a"
}
}

resource "aws_subnet" "west-1-public_1c" {
provider = aws.califonia
vpc_id = aws_vpc.west-vpc.id
availability_zone = "us-west-1c"
cidr_block = "20.0.2.0/24"
tags = {
Name = "west-1st-1-public-1c"
}
}