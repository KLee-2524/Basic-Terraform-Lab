# NETWORKING #
resource "aws_vpc" "kali-vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Basic-Terraform-Lab-vpc"
  }
}

resource "aws_internet_gateway" "kali-gateway" {
  vpc_id = aws_vpc.kali-vpc.id
}

# ROUTING #
resource "aws_route_table" "kali-route-table" {
  vpc_id = aws_vpc.kali-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kali-gateway.id
  }
}

variable "attendee_usernames" {
  type = list(string)

  default = [
    "rastley",
    "ewatson",
    "rreynolds"
  ]
}


locals {
  attendee_index_map = zipmap(var.attendee_usernames, range(length(var.attendee_usernames)))
}


module "basic-terraform-lab" {
    source = "./modules/basic-terraform-lab"
    for_each = local.attendee_index_map

    attendee_number = each.value
    vpc_id          = aws_vpc.kali-vpc.id
    route_table_id  = aws_route_table.kali-route-table.id
}