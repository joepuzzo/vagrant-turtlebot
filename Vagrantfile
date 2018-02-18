# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # ---------------------------------- Define box type -------------------------------------

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory and the number of CPU's allocated on the VM:
    vb.memory = "4000"
    vb.cpus = 2

    # Customize the amount of video RAM for the VM, over 256MB causes instability issues
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end

  # ------------------------------------- SSH Rules ----------------------------------------
  # Enables x11 forwarding over ssh
  config.ssh.forward_x11 = true

  # ------------------------------------ Provisioning -------------------------------------
  
  #Update
  config.vm.provision "shell", inline: "apt-get update"
  
  # Install desktop for UI
  config.vm.provision "shell", inline: "apt-get -y install --no-install-recommends ubuntu-desktop"

	# Install gnome-terminal
  config.vm.provision "shell", inline: "apt-get -y install gnome-terminal"

  # Install all ROS dependencies and environment stuff for development on VM
  config.vm.provision "shell", path: "scripts/ros-bootstrap.sh"

  # Correct RosDep permissions
  config.vm.provision "shell", inline: "rosdep fix-permissions"
  config.vm.provision "shell", inline: "rosdep update", privileged: false

  # Get Xauth for X11 forwarding
  config.vm.provision "shell", inline: "apt-get install xauth"
		
end
