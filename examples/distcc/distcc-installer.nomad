job "distcc-installer-job" {
  datacenters = ["dc-openstack-bhenkel"]
  type = "system"

  //   affinity {
  //   attribute = "${node.class}"
  //   value     = "consul_server"
  //   weight    = -100
  // }

  group "distcc-installer-group" {
    #count = 2
  restart {
    interval = "4h"
    attempts = 1
    delay    = "2h"
    mode     = "delay"
  }
    constraint {
      operator = "distinct_hosts"
      value = "true"
    }
    task "distcc-installer-task" {
      driver = "raw_exec"

      config {
        
        command = "apt"
         args = ["-y", "install", "distcc", "distcc-pump", "gcc", "make", "python3", "python3-dev", "libiberty-dev"]
         //args = ["cd"]
      //   args    = ["agent",  "-datacenter=dc-openstack-bhenkel", "-bind=10.248.6.178","-data-dir=/tmp/consul", "-config-dir=/etc/consul.d"]
      }
      // artifact {
      //   source = "https://github.com/distcc/distcc/releases/download/v3.3.5/distcc-3.3.5.tar.gz"
      // }
    }
  }
}