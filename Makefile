include ./srcs/.env
export

all:
	@sudo mkdir -p /home/npatron/data/mariadb
	@sudo mkdir -p /home/npatron/data/wordpress
	@sudo chmod 777 /home/npatron/data/wordpress
	@sudo chmod 777 /home/npatron/data/mariadb
	@cd srcs && docker-compose up --build -d

clean:
	@cd srcs && docker-compose down

fclean:
	@make clean
	@echo "Removing all the containers, images and volumes"
	@docker system prune -a -f --volumes
	@docker network prune -f
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -qf dangling=true) 2>/dev/null || true
	@sudo rm -rf /home/npatron/data/mariadb
	@sudo rm -rf /home/npatron/data/wordpress
re:
	make fclean
	make all