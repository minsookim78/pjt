#VPC.tf VPC생성
resource "aws_vpc" "east-vpc" {
cidr_block = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
instance_tenancy = "default"
tags = {
Name = "east-vpc"
}
}

resource "aws_vpc" "west-vpc" {
provider = aws.califonia
cidr_block = "20.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
instance_tenancy = "default"
tags = {
Name = "west-vpc"
}
}
