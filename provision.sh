
# Provision File

# Updating...
sudo apt-get update -y

# Upgrade...
sudo apt-get upgrade -y

# Installinh Python3.8 version
sudo apt-get install python3.8 -y

sudo apt install -y python3-pip

sudo apt install build-essential libssl-dev libffi-dev python3-dev -y

# Path to access the requirements.txt
sudo pip3 install -r /home/ubuntu/app/requirements.txt

sudo pip3 install bs4

sudo mkdir /home/vagrant/Downloads

sudo chmod 777 /home/vagrant/Downloads
