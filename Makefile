build: 
	@docker compose build

install:
	@make up
	@docker compose exec jenkins bash -c 'cd && mkdir -p .ssh && ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa -q -N ""'

up:
	@docker compose up -d

down:
	@docker compose down

ps:
	@docker compose ps

app:
	@docker compose exec jenkins bash

show-rsa-key:
	@docker compose exec jenkins cat /var/jenkins_home/.ssh/id_rsa

show-public-key:
	@docker compose exec jenkins cat /var/jenkins_home/.ssh/id_rsa.pub

clean:
	@docker compose down -v --rmi all --remove-orphans

show-init-password:
	@docker compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
