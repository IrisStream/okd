NUM_MASTER_NODE = 2 
NUM_WORKER_NODE = 1
IP_PREFIX = "192.168.56."
MANAGER_NODE_BOX = "centos/stream8"
CLUSTER_NODE_BOX = "irisstream/fedora-coreos"
NODE_IP_START = 20

Vagrant.configure("2") do |manager| 
	# Config manager node
	manager.vm.box = MANAGER_NODE_BOX
	manager.vm.provider "virtualbox" do |vb|
		vb.memory = "1024"
		vb.cpus = 1
	end
	manager.vm.hostname = "manager"
	manager.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START - 1}"
end

Vagrant.configure("2") do |okd| 
	okd.ssh.username = "core"
	okd.vm.synced_folder ".", "/vagrant", disabled: true
	# okd.vm.synced_folder ".", "/vagrant", disabled: true
	okd.vm.box = CLUSTER_NODE_BOX

	# Config bootstrap node
	okd.vm.define "bootstrap" do |bootstrap|
		bootstrap.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
			vb.cpus = 2
		end
		bootstrap.vm.hostname = "bootstrap"
		bootstrap.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START}"
	end

	# Config master node
	(1..NUM_MASTER_NODE).each do |i|
		okd.vm.define "master-#{i}" do |master|
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
		okd.vm.define "worker-#{i}" do |worker|
			worker.vm.provider "virtualbox" do |vb|
				vb.memory = "2048"
				vb.cpus = 2
			end
			worker.vm.hostname = "worker-#{i}"
			worker.vm.network "private_network", ip: "#{IP_PREFIX}#{NODE_IP_START + NUM_MASTER_NODE + i}"
		end
	end
end