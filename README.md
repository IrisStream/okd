# List of machine

| VM                          | OS              | HOSTNAME             | IP ADDRESS    | MEMORY | vCPU | STORAGE |
|-----------------------------|-----------------|----------------------|---------------|--------|------|---------|
| Manager Node (DNS, HAProxy) | CentOS-Stream-8 | apps                 | 192.168.56.16 | 4GB    | 4    | 50GB    |
| Bootstrap Node              | Fedora CoreOS   | okd4-bootstrap       | 192.168.56.29 | 16GB   | 4    | 50GB    |
| Master Node 1               | Fedora CoreOS   | okd4-control-plane-1 | 192.168.56.30 | 16GB   | 4    | 50GB    |
| Master Node 2               | Fedora CoreOS   | okd4-control-plane-2 | 192.168.56.31 | 16GB   | 4    | 50GB    |
| Compute Node 1              | Fedora CoreOS   | okd4-compute-1       | 192.168.56.33 | 16GB   | 4    | 50GB    |