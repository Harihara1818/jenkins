output "vpc_name" {
  value = data.aws_vpc.desu.cidr_block
}

output "subnet_name" {
  value = data.aws_subnet_ids.desu_subnet1.tags
}


output "aws_instance_count" {
  value = aws_instance.hari[*].public_ip
}






/*
output "created_by" {
    value = "hariharaprasad"
}

output "public_ip"{
    value = aws_instance.web.public_ip
}
output "vpc_name"{
  value = aws_vpc.example
}

output "my_subnet"{
  value = aws_subnet.main


output "network"{
    value = data.aws_vpc.desu
}
}*/