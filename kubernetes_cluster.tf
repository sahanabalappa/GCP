


provider "kubernetes" {
   

    config_context_cluster="gke_${google_container_cluster.wp-cluster.project}_${google_container_cluster.wp-cluster.location}_${google_container_cluster.wp-cluster.name}"
}



resource "kubernetes_service" "my-wp-service" {


    metadata{

        name="my-wp-service"
        
        labels={
            
            env="test"
            name="my-wp-service"
        }
    }

    spec{


    type="LoadBalancer"
     
     selector={

     app="my-wp"
   

     }

     port{

         port=80
         target_port=80
      
     }

    
    }
}

output "svc_ip"{

    value=kubernetes_service.my-wp-service.load_balancer_ingress[0].ip
}


// wp-deployment
resource "kubernetes_deployment" "wp-rc-tf"{


    metadata{

        name="wp-rc-tf"
        labels={
            name="wp-rc-tf"
            app="my-wp"
        }
    }

    spec{
      replicas=1
      selector{
          match_labels = {
         app="my-wp"
      }
 
         
      }
      template{

          metadata{

              name="wp-pod-tf"
              labels={
                  app="my-wp"
              
          }
          }
              spec{

                container{
                    name="wp-con-tf"
                    image="wordpress"
                     env{
                        name="WORDPRESS_DB_HOST"
                         value=aws_db_instance.wp-db.address
                        
                    }
                
                    env{
                        name="WORDPRESS_DB_USER"
                        value=aws_db_instance.wp-db.username
                    
              
                        }
                    
                    env{
                        name="WORDPRESS_DB_PASSWORD"
        
                         

                            value=aws_db_instance.wp-db.password
                    
       
                    }
                    
                      env{
                        name="WORDPRESS_DB_NAME"
                        value=aws_db_instance.wp-db.name
                    } 
                }
              }
      }
    }
}

// open wordpress site

resource "null_resource" "open_wordpress" {

    provisioner "local-exec" {

        command ="chrome ${kubernetes_service.my-wp-service.load_balancer_ingress[0].ip}"
    }
}
