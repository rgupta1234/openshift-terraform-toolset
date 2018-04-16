output "bastion_public_dns" {
  value = "${aws_instance.bastion.public_dns}"
}

output "bastion_public_ip" {
  value = "${aws_instance.bastion.public_ip}"
}

output "bastion_private_ip" {
  value = "${aws_instance.bastion.private_ip}"
}

output "master_public_dns" {
  value = "${join(",", aws_instance.master.*.public_dns)}"
}
output "master_public_ip" {
  value = "${join(",", aws_instance.master.*.public_ip)}"
}
output "master_private_ip" {

  value = "${join(",", aws_instance.master.*.private_ip)}"
}


output "nodes_public_dns" {
  value = "${join(",", aws_instance.nodes.*.public_dns)}"
}
output "nodes_public_ip" {
  value = "${join(",", aws_instance.nodes.*.public_ip)}"
}
output "nodes_private_ip" {

  value = "${join(",", aws_instance.nodes.*.private_ip)}"
}

