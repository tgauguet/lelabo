

migrate:
	bundle exec rake db:migrate

init:
	bundle exec rake db:drop
	bundle exec rake db:create
	bundle exec rake db:migrate
	bundle exec rake db:seed

seed:
	bundle exec rake db:seed

push:
	git push heroku master

add:
	git status
	git add .
	git status

console:
	heroku run rails c

routes:
	bundle exec rake routes

brakeman:
	brakeman -q -z

	
