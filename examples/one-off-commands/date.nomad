job "date" {
  datacenters = ["dc-openstack-bhenkel"]
  type = "batch"

  group "date-group" {
    count = 1
    task "date" {
      driver = "raw_exec"
            
      config {
        command = "date"
      }
    }
  }
}
//nomad job run date.nomad
//nomad job stop -namespace=default -purge -yes date