all:
	@sudo mkdir -p /home/mfroissa/data/db /home/mfroissa/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build -d

install :
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker
	@sudo mkdir -p /home/mfroissa/data/db /home/mfroissa/data/wordpress

reboot :
	@sudo reboot
	@sleep 60 # Wait for 60 seconds for the system to reboot

check_db:
	@docker exec -it mariadb mysql -u root -p

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -a
	@docker volume rm -f $$(docker volume ls -q)
	@sudo rm -rf /home/mfroissa/data
	#@docker network rm mynetwork


.PHONY: all clean install restart down
