Vagrant.configure(2) do |config|
  config.vm.guest = :windows
  config.vm.boot_timeout = 600

  config.vm.communicator = 'winrm'
  config.winssh.shell = 'powershell'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.network :forwarded_port, guest: 3389, host: 33389, auto_correct: true
  config.vm.network :forwarded_port, guest: 1433, host: 11433, auto_correct: true
end
