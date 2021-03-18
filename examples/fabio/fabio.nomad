job "fabio" {
  datacenters = ["dc-openstack-bhenkel"]

  group "fabio" {
        network {

          port "lb" {
            static = 9998
          }

          port "ui" {
            static = 9999
          }
        }
    task "fabio" {
      driver = "docker"

      config {
        network_mode = "host"
        image        = "fabiolb/fabio:1.5.14-go1.15"
        args         = ["-proxy.strategy=rr"]
      }

    }
  }
}