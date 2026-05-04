variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "kali_ami" {
    description = "AMI of the Kali VM to deploy"
    type        = string
    default     = "ami-0f36db53af1422a10"
}

variable "winser22_ami" {
    description = "AMI of the WinSer22 VM to deploy"
    type        = string
    default     = "ami-06137cb527bfce12a"
}

variable "vpc_id" {
    description = "ID of the lab vpc"
    type        = string
}

variable "route_table_id" {
    description = "ID of the route table"
    type        = string
}

variable "attendee_number" {
    description = "Used to create separate subnets for each individual attendee. This value cannot be greater than 255."
    type        = string
}

variable "winser22_setup_script" {
    description = "Set script to configure Kali Linux VM upon deployment"
    type        = string
    default     = <<-EOT
    <powershell>
    Set-NetFirewallRule -Name 'CoreNet-Diag-ICMP4-EchoRequest-In' -Enabled True
    Set-NetFirewallRule -Name 'CoreNet-Diag-ICMP4-EchoRequest-Out' -Enabled True
    </powershell>
    EOT
}
