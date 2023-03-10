NUM_MASTER_NODE = 2 
NUM_WORKER_NODE = 1
IP_PREFIX = "192.168.56."
MANAGER_NODE_BOX = "centos/stream8"
CLUSTER_NODE_BOX = "generic/fedora36"
NODE_IP_START = 20

Vagrant.configure("2") do |config| 
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
		bootstrap.vm.box = CLUSTER_NODE_BOX
		bootstrap.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
			vb.cpus = 2
		end
		bootstrap.vm.hostname = "bootstrap"
		bootstrap.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START}"
	end

	# Config master node
	(1..NUM_MASTER_NODE).each do |i|
		config.vm.define "master-#{i}" do |master|
			master.vm.box = CLUSTER_NODE_BOX
			master.vm.provider "virtualbox" do |vb|
				vb.memory = "2048"
				vb.cpus = 2
			end
			master.vm.hostname = "master-#{i}"
			master.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START + i}"
		end
	end

	# Config worker node
	(1..NUM_WORKER_NODE).each do |i|
		config.vm.define "worker-#{i}" do |worker|
			worker.vm.box = CLUSTER_NODE_BOX
			worker.vm.provider "virtualbox" do |vb|
				vb.memory = "2048"
				vb.cpus = 2
			end
			worker.vm.hostname = "worker-#{i}"
			worker.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START + NUM_MASTER_NODE + i}"
		end
	end
end