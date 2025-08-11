output "kali_details" {
    value = {
        name = aws_instance.kali-vm.tags["Name"]
        pub_ip = aws_instance.kali-vm.public_ip
    }
    description = "Kali Linux EC2 instance name"
}

output "target_details" {
    value = {
        name = aws_instance.winser22-vm.tags["Name"]
        pri_ip = aws_instance.winser22-vm.private_ip
    }
    description = "WinSer22 EC2 instance details"
}