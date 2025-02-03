all: 
	mkdir -p /home/mfeldman/data/mariadb
	mkdir -p /home/mfeldman/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build -d
	@clear

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker compose -f ./srcs/docker-compose.yml down;

fclean: clean
	sudo rm -rf /home/mfeldman/data/mariadb/*
	sudo rm -rf /home/mfeldman/data/wordpress/*
	-docker system prune -af
	@clear	

re: fclean all

.Phony: all logs clean fclean
