// provider google : command: gcloud auth application-default login
provider "google" {
  credentials = file(var.gcp_credentials_path)
  project     = var.gcp_project_id
  region      = var.gcp_current_region
}




provider "aws"{

    profile= var.aws_profile
    region= var.aws_region
}



module "gcp_aws"{


 source="./modules"

// GCP VPC SUBNET FIREWALL AND GCE

gcp_project_id=var.gcp_project_id

vpc_name=var.vpc_name

subnet_name=var.subnet_name

gcp_subnet_region=var.gcp_subnet_region

gcp_subnet_ip_cidr_range=var.gcp_subnet_ip_cidr_range

gcp_firewall=var.gcp_firewall

gcp_protocols_allowed=var.gcp_protocols_allowed

gcp_ports_over_tcp=var.gcp_ports_over_tcp

google_container_cluster_name=var.google_container_cluster_name

google_container_cluster_location=var.google_container_cluster_location

google_container_cluster_node_count=var.google_container_cluster_node_count

google_container_cluster_node_machine_type=var.google_container_cluster_node_machine_type


// AWS RDS


aws_rds_storage_type=var.aws_rds_storage_type

aws_rds_engine=var.aws_rds_engine

aws_rds_engine_version=var.aws_rds_engine_version

aws_rds_instance_class=var.aws_rds_instance_class

aws_rds_publicly_accessible=var.aws_rds_publicly_accessible

aws_rds_deletion_protection=var.aws_rds_deletion_protection

aws_rds_dbname=var.aws_rds_dbname

aws_rds_username=var.aws_rds_username

aws_rds_password=var.aws_rds_password

}
