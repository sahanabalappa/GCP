
variable "aws_rds_storage_type"{}

variable "aws_rds_engine"{}

variable "aws_rds_engine_version"{}


variable "aws_rds_instance_class"{}

variable "aws_rds_publicly_accessible"{}

variable "aws_rds_deletion_protection"{}


variable "aws_rds_dbname"{}

variable "aws_rds_username"{}

variable "aws_rds_password"{}





resource "aws_db_instance" "wp-db" {
  allocated_storage    = 20
  storage_type         = var.aws_rds_storage_type
  engine               = var.aws_rds_engine
  engine_version       = var.aws_rds_engine_version
  instance_class       = var.aws_rds_instance_class
  name                 = var.aws_rds_dbname
  username             = var.aws_rds_username
  password             = var.aws_rds_password
  parameter_group_name = "default.mysql5.7"
  publicly_accessible  = var.aws_rds_publicly_accessible
  deletion_protection = var.aws_rds_deletion_protection
  skip_final_snapshot= true
}


output "db"{

    value=aws_db_instance.wp-db.address
}
