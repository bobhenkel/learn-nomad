job "workstations" {
    datacenters = ["dc-openstack-bhenkel"]
    namespace = "bhenkel"
  group "workstations" {
    task "workstation" {

  driver = "docker"

  config {
      image = "ubuntu"
      entrypoint = [
          "tail", "-f", "/dev/null",
      ]
  }

  resources {
      cpu = 1000
      memory = 2000
  }
}
  }
}