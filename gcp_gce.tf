variable "google_container_cluster_name"{}

variable "google_container_cluster_location"{}

variable "google_container_cluster_node_count"{}

variable "google_container_cluster_node_machine_type"{}

// variable "gcp_project_id"{}

// configure GCE


resource "google_container_cluster" "wp-cluster" {
  name               = var.google_container_cluster_name
  location           = var.google_container_cluster_location
  initial_node_count = var.google_container_cluster_node_count

 master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }


node_config {
   
    machine_type= var.google_container_cluster_node_machine_type
}


    network= google_compute_network.vpc_network.name
    project=var.gcp_project_id
    subnetwork=google_compute_subnetwork.dev-network.name

}


// running the command to update the kubeconfig file

resource "null_resource" "cluster" {

    provisioner "local-exec" {

        command ="gcloud container clusters get-credentials ${google_container_cluster.wp-cluster.name}  --region ${google_container_cluster.wp-cluster.location} --project ${google_container_cluster.wp-cluster.project}"
    }
}


