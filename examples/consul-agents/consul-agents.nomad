job "consul-agent" {
  datacenters = ["dc-openstack-bhenkel"]
  type = "service"
    affinity {
    attribute = "${node.class}"
    value     = "consul_server"
    weight    = -100
  }

  group "consul-agent" {
    count = 1
    task "consul" {
      driver = "raw_exec"
            
      config {
        command = "consul"
        args    = ["agent",  "-datacenter=dc-openstack-bhenkel", "-bind=10.248.6.178","-data-dir=/tmp/consul", "-config-dir=/etc/consul.d"]
      }
      artifact {
        source = "https://releases.hashicorp.com/consul/1.9.4/consul_1.9.4_linux_amd64.zip"
      }
    }
  }
}