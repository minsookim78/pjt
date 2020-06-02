#RouteTable.tf : 기본 라우팅 테이블 생성

resource "aws_route_table" "rt-east-1-public"{
    vpc_id= aws_vpc.east-vpc.id
        route {
            cidr_block= "0.0.0.0/0"
            gateway_id= aws_internet_gateway.esat-1-IGW.id
              }
    tags = {
    Name = "rt-east-1-public"
        }
}

resource "aws_route_table_association" "rt-east-1_public_1a"{
subnet_id= aws_subnet.east-1-public_1a.id
route_table_id=aws_route_table.rt-east-1-public.id
}

resource "aws_route_table_association" "rt-east-1_public_1c"{
subnet_id= aws_subnet.east-1-public_1c.id
route_table_id= aws_route_table.rt-east-1-public.id
}



resource "aws_route_table" "rt-west-1-public"{
    provider =aws.califonia
    vpc_id= aws_vpc.west-vpc.id
        route {
            cidr_block= "0.0.0.0/0"
            gateway_id= aws_internet_gateway.west-1-IGW.id
              }
    tags = {
    Name = "rt-west-1-public"
        }
}

resource "aws_route_table_association" "rt-west-1_public_1a"{
provider =aws.califonia
subnet_id= aws_subnet.west-1-public_1a.id
route_table_id=aws_route_table.rt-west-1-public.id
}

resource "aws_route_table_association" "rt-west-1_public_1c"{
provider =aws.califonia
subnet_id= aws_subnet.west-1-public_1c.id
route_table_id= aws_route_table.rt-west-1-public.id
}