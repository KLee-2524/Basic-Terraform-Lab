output "lab_instances" {
    value = {
        for attendee, mod in module.vsftpd234-lab :
        attendee => {
            kali_name   = module.basic-terraform-lab["${attendee}"].kali_details.name
            kali_pub_ip = module.basic-terraform-lab["${attendee}"].kali_details.pub_ip
            
            target_name   = module.basic-terraform-lab["${attendee}"].target_details.name
            target_pri_ip = module.basic-terraform-lab["${attendee}"].target_details.pri_ip
        }
    }
}