NUM_MASTER_NODE = 2 
NUM_WORKER_NODE = 1
IP_PREFIX = "192.168.56."
MANAGER_NODE_BOX = "irisstream/centos8-stream"
CLUSTER_NODE_BOX = "irisstream/rhcos"
NODE_IP_START = 20

Vagrant.configure("2") do |config| 
	config.vm.provision "shell", path: "script.sh", privileged: true
	# Config manager node
	config.vm.define "manager" do |manager|
		manager.vm.box = MANAGER_NODE_BOX
		manager.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
			vb.cpus = 1
		end
		manager.vm.hostname = "manager"
		manager.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START - 1}"
	end

	# Config bootstrap node
	config.vm.define "bootstrap" do |bootstrap|
		bootstrap.ssh.username = "core"
		bootstrap.vm.box = CLUSTER_NODE_BOX
		bootstrap.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
			vb.cpus = 2
		end
		bootstrap.vm.hostname = "bootstrap"
		bootstrap.vm.synced_folder ".", "/vagrant", disabled: true
		bootstrap.vm.synced_folder ".", "/var/home/core/host-synced-folder"
		bootstrap.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START}"
	end

	# Config master node
	(1..NUM_MASTER_NODE).each do |i|
		config.vm.define "master-#{i}" do |master|
			master.ssh.username = "core"
			master.vm.box = CLUSTER_NODE_BOX
			master.vm.provider "virtualbox" do |vb|
				vb.memory = "2048"
				vb.cpus = 2
			end
			master.vm.synced_folder ".", "/vagrant", disabled: true
			master.vm.synced_folder ".", "/var/home/core/host-synced-folder"
			master.vm.hostname = "master-#{i}"
			master.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START + i}"
		end
	end

	# Config worker node
	(1..NUM_WORKER_NODE).each do |i|
		config.vm.define "worker-#{i}" do |worker|
			worker.ssh.username = "core"
			worker.vm.box = CLUSTER_NODE_BOX
			worker.vm.provider "virtualbox" do |vb|
				vb.memory = "2048"
				vb.cpus = 2
			end
			worker.vm.synced_folder ".", "/vagrant", disabled: true
			worker.vm.synced_folder ".", "/var/home/core/host-synced-folder"
			worker.vm.hostname = "worker-#{i}"
			worker.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START + NUM_MASTER_NODE + i}"
		end
	end
end