#key.tf :키생성
resource "aws_key_pair" "sshkey" {
  key_name   = "Hholic"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDqC/WOlAyBekf7b4fQCMHtHigygKMS4f8DbIhuYZV0qC1ehiTJziM5Co/UUElFQ+O8wmRBzGLC74rVWFzQhEQKr+9mj+UTwf7NaNyVEcWxTt8qTjtJQnWD5BV629u6YIq1ck0waX3/0xWWAalFkLSQfrjYF0PV2TajTC/Eq5uKm5YJpJljwd0bMZe3xxXKC1VNe/6HTpKH/0cumilDuHZp2QOAkTJ8UD/9MXsuFKma9DRfvpQoRAmIgF8ANF2T0FM4d66eOti58rsjMaN5r7kYkLeK63OCwun9MaLKImziH10fj6teB/DMk3NtmggA7Ke8UqgPvRDa6Qvxs4VWo5sd ubuntu@ip-10-0-1-11"
}
