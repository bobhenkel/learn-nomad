job "http-echo" {
  datacenters = ["dc-openstack-bhenkel"]
  namespace = "bhenkel"
  group "echo" {
      ephemeral_disk {
      size    = 10
    }
         network {
          port "http" {}
        }
    count = 1
    task "server" {
        logs {
        max_files     = 1
        max_file_size = 5
      }
      driver = "docker"
        resources {
      cpu = 10
      memory = 10
      disk = 10
  }
      config {
        network_mode = "host"
        image = "hashicorp/http-echo:latest"
        args  = [
          "-listen", "0.0.0.0:${NOMAD_PORT_http}",
          "-text", "Hello and welcome banana from ${node.unique.id} ${node.unique.name}:${NOMAD_PORT_http}",
        ]
      }

           service {
        name = "http-echo"
        tags = [
          "http-echo",
          "urlprefix-/echo" # <--LOOK-HERE--
        ]
        port = "http"

        check {
          name     = "http-echo port alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}