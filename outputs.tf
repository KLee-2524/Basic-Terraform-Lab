output "lab_instances" {
    value = {
        for attendee, mod in module.basic-terraform-lab :
        attendee => { 
            target_name   = module.basic-terraform-lab["${attendee}"].target_details.name
            target_pub_ip = module.basic-terraform-lab["${attendee}"].target_details.pub_ip
        }
    }
}