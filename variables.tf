variable gcp_zones {
  description = "A list of GCP zone to launch in"
  type        = list
}
# Source code folder
variable "scbootstrap" {
  type       = string
  default    = "/usr/local/share/dm-terraform/frontend/bootstrap/"
}

# Seed Creds
variable "scpath" {
  type       = string
  default    = "/usr/local/share/dm-terraform/seed/bootstrap/"
}


