
terraform import command to attach the existing Docker container to the docker_container.web resource you just created. 
```
terraform import docker_container.web $(docker inspect -f {{.ID}} hashicorp-learn)
```