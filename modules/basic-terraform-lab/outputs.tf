output "target_details" {
    value = {
        name = aws_instance.winser22-vm.tags["Name"]
        pub_ip = aws_instance.winser22-vm.public_ip
    }
    description = "WinSer22 EC2 instance details"
}