variable "gcp_current_region"{

   default="asia-south1"


}


variable "gcp_credentials_path"{


    default="path\to\credentials\file"
}


variable "gcp_project_id"{

    default="ordinal-tower-287507"
}



// VPC


variable "vpc_name"{

    default="vpc-network"
}



variable "subnet_name"{

    default="dev-subnetwork"
}

variable "gcp_subnet_region"{

    default="asia-southeast1"
}


variable "gcp_subnet_ip_cidr_range"{

    default="10.0.1.0/24"
}

variable "gcp_firewall"{

    default="allow-ssh-ping-http"

}


variable "gcp_protocols_allowed"{


   default="icmp"

}


variable "gcp_ports_over_tcp"{
   
    type=list
    default=["80", "22"]
}

// GCE 

variable "google_container_cluster_name"{

    default="wp-cluster"
}

variable "google_container_cluster_location"{

    default="asia-southeast1"
}

variable "google_container_cluster_node_count"{

    default=1
}

variable "google_container_cluster_node_machine_type"{

    default="n1-standard-1"
}







// aws 


variable "aws_region"{


 default="ap-south-1"

}

variable "aws_profile"{


 default="profile"

}


// aws_rds


variable "aws_rds_storage_type"{

    default="gp2"
}

variable "aws_rds_engine"{

    default="mysql"
}

variable "aws_rds_engine_version"{

    default="5.7"
}


variable "aws_rds_instance_class"{

    default="db.t2.micro"
}

variable "aws_rds_publicly_accessible"{

    default=true
}

variable "aws_rds_deletion_protection"{

    default=true
}


variable "aws_rds_dbname"{

    default="mydb"
}


variable "aws_rds_username"{

    default="username"
}

variable "aws_rds_password"{


    default="password"
}
