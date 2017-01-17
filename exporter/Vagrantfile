# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # https://docs.vagrantup.com.
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false
  config.vm.synced_folder ".", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # https://www.vagrantup.com/docs/provisioning/docker.html
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant_data/",
      args: "-t shadi/dbdiff-exporter"
    d.run "shadi/dbdiff-exporter",
      daemonize: true,
      args: "--entrypoint entry.sh"
  end
end
