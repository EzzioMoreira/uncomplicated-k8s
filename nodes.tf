terraform {
  required_providers {
    virtualbox = {
      source = "leodotcloud/virtualbox"
      version = "0.0.3"
    }
  }
}

# There are currently no configuration options for the provider itself.
resource "virtualbox_vm" "node" {
  count     = 3
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/ubuntu/boxes/trusty64/versions/20190514.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "1024 mib"
  #user_data = file("${path.module}./virtualbox.pub")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}

output "IPAddr_3" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 3)
}