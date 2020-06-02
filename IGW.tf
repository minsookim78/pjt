#IGW.tf : 인터넷게이트웨이 생성

resource "aws_internet_gateway" "esat-1-IGW" {
vpc_id = aws_vpc.east-vpc.id
tags = {
Name = "esat-1-IGW"
}
}

resource "aws_internet_gateway" "west-1-IGW" {
provider =aws.califonia
vpc_id = aws_vpc.west-vpc.id
tags = {
Name = "west-1-IGW"
}
}