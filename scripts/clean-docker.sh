docker system prune --all
docker images -f dangling=true -q | xargs docker rmi -f
docker volume ls -f dangling=true
docker volume prune
