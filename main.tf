// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_instance" "frontend" {
 count        = length(var.gcp_zones) 
 name         = "dmlc-frontend-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = var.gcp_zones[count.index]

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

metadata_startup_script = file("${var.scbootstrap}/puppet.sh")
 metadata = {
   ssh-keys = "dmalicia:${file("${var.scpath}/id_rsa.pub")}"
            }

 network_interface {
   network = "default"
}

resource "google_compute_firewall" "frontend" {
 name    = "frontend-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["80","8140"]
 }
}
}
