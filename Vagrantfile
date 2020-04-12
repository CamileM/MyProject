
# VAGRANT FILE

  # Path it takes to access the provision.sh
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  # config.vm.provision "shell", path: "./provision.sh"
  # config.vm.synced_folder './app', "/home/ubuntu/app" # The path to access the 'APP'

  # Connects Provision with your Chef
  config.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "ItJobsWatch" # Named After The File.
      chef.arguments = "--chef-license accept"
    end
  end
