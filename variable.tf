#variable.tf :변수생성
variable "amazon_linux_west" {
# Amazon Linux AMI 2017.03.1 (HVM), SSD Volume Type - ami-4af5022c
    default = "ami-04e59c05167ea7bd5"
}

variable "amazon_linux_east" {
# Amazon Linux AMI 2017.03.1 (HVM), SSD Volume Type - ami-4af5022c
    default = "ami-09d95fab7fff3776c"
}
variable "dev_keyname" {
    default = "Hholic"
}
variable "alb_account_id_east" {
    default = "127311923021"
}
variable "alb_account_id_west" {
    default = "027434742980"
}

