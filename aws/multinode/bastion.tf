resource "aws_instance" "bastion" {

  ami           = "${var.ami}"
  instance_type = "t2.large"
  key_name 	= "${var.key_name}"
  security_groups  = ["${var.security_group}"]

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    inline = [
       "sudo /usr/sbin/subscription-manager refresh",
      "sudo /usr/sbin/subscription-manager register --username ${var.rhn_username} --password ${var.rhn_password}",
      "sudo /usr/sbin/subscription-manager attach --pool=${var.rhn_pool}",
      "sudo /usr/sbin/subscription-manager repos --disable=\"*\"",
      "sudo /usr/sbin/subscription-manager repos --enable=\"rh-gluster-3-for-rhel-7-server-rpms\" --enable=\"rhel-7-server-rpms\" --enable=\"rhel-7-server-extras-rpms\" --enable=\"rhel-7-server-ose-3.10-rpms\" --enable=\"rhel-7-fast-datapath-rpms\" --enable=\"rhel-7-server-ansible-2.5-rpms\" --enable=\"rh-gluster-3-client-for-rhel-7-server-rpms\"",
      "sudo /usr/bin/yum install -y wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct openshift-ansible-playbooks  docker-1.13.1",
      "sudo /usr/bin/yum install -y yum-utils wget git net-tools bind-utils iptables-services bridge-utils bash-completion nfs-utils dstat mlocate",
      "sudo /usr/bin/yum install -y cns-deploy heketi-client",
      "sudo /usr/bin/yum install -y rpcbind",
      "git clone https://github.com/rgupta1234/openshift-install-toolset.git",
      "git clone https://github.com/rgupta1234/openshift-terraform-toolset.git"
    ]
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source = "${var.private_key_path}"
    destination = "/home/ec2-user/ec2-user.pem"
  }

  tags {
    Name = "${var.subdomain}-bastion"
  }
} 
