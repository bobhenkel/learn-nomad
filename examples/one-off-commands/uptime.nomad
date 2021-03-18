job "uptime" {
  datacenters = ["dc-openstack-bhenkel"]
  type = "batch"

  group "uptime-group" {
    count = 1
    task "uptime" {
      driver = "raw_exec"
            
      config {
        command = "uptime"
      }
    }
  }
}
//nomad job run date.nomad
//nomad job stop -namespace=default -purge -yes date