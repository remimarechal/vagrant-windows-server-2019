Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
     config.vm.box = "windows-server-2019-standard-desktop"
     vb.gui = false
     vb.memory = 4096
     vb.cpus = 4
     vb.customize ["modifyvm", :id, "--vram", "32"]
  end

  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 9990, host: 9990, auto_correct: true
end
