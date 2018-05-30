variable "key_name" {
  description = "AWS Keyname"
  default = "gupta"
}
variable "ami" {
  description = "ami image"
  default = "ami-03291866"
}
variable "private_key_path" {
  description = "AWS Keyname"
  default = "/Users/rgupta/Documents/openshift/INSTALLS/key/gupta.pem"
}
variable "security_group" {
  description = "Security Group"
  default = "default"
}
variable "rhn_username" {
  description = "RHN username"
  default = "rgupta@redhat.com"
}
variable "rhn_password" {
  description = "RHN password"
  default = "Roger12,"
}
variable "rhn_pool" {
  description = "Pool ID to attach to"
  default = "8a85f98b6200c40c0162016c23aa0b53"
}
variable "domain" {
  description = "Route53 hosted domain"
  default = "rg.osecloud.com"
}
variable "subdomain" {
  description = "Subdomain to use for this event"
  default = "rhlabliquide"
}
variable "create_nfs" { 
  description = "Create NFS server"
  default = false
}
variable "master" {
  description = "Master configurations"
  default = {
    count = 1
    instance_type = "m4.xlarge"
    root_volume_size = 30
    docker_volume_size = 50
    nfs_volume_size = 100
  }
}
variable "infra" {
  description = "Infra configurations"
  default = {
    count = 0
    root_volume_size = 30
    docker_volume_size = 50
    instance-type = "m4.xlarge"
  }
}
variable "node" {
  description = "Node configurations"
  default = {
    count = 3
    instance_type = "m4.xlarge"
    root_volume_size = 30
    docker_volume_size = 50
    cns_volume_size = 500
  }
}
variable "nfs" {
  description = "NFS configurations"
  default = {
    count = 0
    instance_type = "m4.xlarge"
    root_volume_size = 30
    docker_volume_size = 50
    nfs_volume_size = 100
  }
}
