output "target_details" {
    value = {
        name = aws_instance.winser22-vm.tags["Name"]
        pri_ip = aws_instance.winser22-vm.private_ip
    }
    description = "WinSer22 EC2 instance details"
}