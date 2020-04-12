#
# Cookbook:: ItJobsWatch
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'source_update' do
  action :update
end

# INSTALLING TTHE PYTHON PACKAGEs
# package 'python3.8' do
#   action :install
# end

package 'python3-pip'

# Commands to install python3.8 version
# execute 'install python3.8' do
#   command 'sudo apt-get install python3.8 -y'
#   action :run
# end
#
# execute 'install python3-pip' do
#   command 'sudo apt-get install python3-pip -y'
#   action :run
# end
#
# execute 'install requests' do
#   command 'pip3 install requests'
#   action :run
# end
#
# execute 'install bs4' do
#   command 'pip3 install bs4'
#   action :run
# end
#
# execute 'install configmanager' do
#   command 'pip3 install configmanager'
#   action :run
# end
#
# execute 'install pytest' do
#   command 'pip3 install pytest'
#   action :run
# end

# INSTALLING APP REQUIREMENTS
# bash 'installing app requirements' do
#   code <<-EOL
#   pip3 install -r /home/ubuntu/app/requirements.txt
#   EOL
# end

remote_directory '/home/ubuntu/app' do
  source 'app'
  action :create
end

bash 'pip install requirements.txt' do
  user 'root'
  group 'root'
  code <<-EOH
  sudo pip3 install -r /home/ubuntu/app/requirements.txt
  EOH
end

# directory '/' do
#   action :create
#   mode '0777'
# end
#
#
# directory '/vagrant/' do
#   action :create
#   mode '0777'
# end

# directory '/home/vagrant/Downloads' do
#   owner 'root'
#   group 'root'
#   action :create
#   mode '0777'
# end

directory '/home/ubuntu/Downloads' do
  owner 'root'
  group 'root'
  action :create
  mode '0777'
end


# INSTALLING JRE
bash 'installing_jre' do
  code <<-EOH
    sudo apt-get -y install default-jre
  EOH
end

# INSTALLING JDK
bash 'install_jdk' do
  code <<-EOH
    sudo apt-get -y install default-jdk
  EOH
end

# USING KEY FROM JENKINS
bash 'getting key from jenkins' do
  code <<-EOH
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  EOH
end

# USING JENKINS RESOURCES
bash 'getting jenkins recources' do
  code <<-EOH
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  EOH
end

# UPDATING SOURCE CODE
bash 'updating source code' do
  code <<-EOH
    sudo apt-get update -y
  EOH
end

# INSTALLING JENKINS
bash 'installing jenkins' do
    code <<-EOH
      sudo apt-get install jenkins -y
    EOH
end
