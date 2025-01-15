```docker-compose
version: "3.9"
services:
	db:
		image: mysql:8.3.0
		volumes:
			- db_data:/var/lib/mysql
		restart: always 
		environment: 
			MYSQL_ROOT_PASSWORD: 1234 
			MYSQL_DATABASE: todo-list-db 
			MYSQL_USER: todo-user 
			MYSQL_PASSWORD: 1234
app:

php:
```
