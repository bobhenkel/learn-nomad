job "distcc-installer-job" {
  datacenters = ["dc-openstack-bhenkel"]
  type = "batch"

    affinity {
    attribute = "${node.class}"
    value     = "consul_server"
    weight    = -100
  }

  group "distcc-installer-group" {
    count = 1
    task "distcc-installer-task" {
      driver = "raw_exec"
            
      config {
         command = "apt-get"
         args = ["-y", "install", "distcc"]
         //args = ["cd"]
      //   args    = ["agent",  "-datacenter=dc-openstack-bhenkel", "-bind=10.248.6.178","-data-dir=/tmp/consul", "-config-dir=/etc/consul.d"]
      }
      // artifact {
      //   source = "https://github.com/distcc/distcc/releases/download/v3.3.5/distcc-3.3.5.tar.gz"
      // }
    }
  }
}