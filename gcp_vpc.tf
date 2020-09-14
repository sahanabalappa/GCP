
variable "vpc_name"{}

variable "gcp_project_id"{}

variable "subnet_name"{}

variable "gcp_subnet_region"{}


variable "gcp_subnet_ip_cidr_range"{}

variable "gcp_firewall"{}


variable "gcp_protocols_allowed"{}


variable "gcp_ports_over_tcp"{}


// create a VPC

resource "google_compute_network" "vpc_network" {
  name =  var.vpc_name
  auto_create_subnetworks=false
  project= var.gcp_project_id

}


// create a subnetwork

resource "google_compute_subnetwork" "dev-network" {
  name          = var.subnet_name
  ip_cidr_range = var.gcp_subnet_ip_cidr_range
  region        = var.gcp_subnet_region
  network       = google_compute_network.vpc_network.id

}


// create a firewall

resource "google_compute_firewall" "default" {
  name    = var.gcp_firewall
  network = google_compute_network.vpc_network.name

  allow {
    protocol = var.gcp_protocols_allowed
  }

  allow {
    protocol = "tcp"
    ports    = var.gcp_ports_over_tcp
  }
}