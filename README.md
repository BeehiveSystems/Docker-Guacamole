# Docker-Guacamole

## Installation

#### Initializing the MySQL Database

`# docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql`

## Upgrade

1. Copy SQL update script from Guacamole container to host

	`# docker cp guacamole_client_1:/opt/guacamole/mysql/schema/upgrade/upgrade-pre-*.*.*.sql ./`

2. Copy the SQL update script from host to MySQL container

	`# docker cp upgrade-pre-*.*.*.sql guacamole_db_1:/tmp`

3. Import the script into the database

	`# docker exec -it guacamole_db_1 bash`
	`# mysql -u root -p guacamole_db < /tmp/upgrade-pre-*.*.*.sql`

4. Edit docker-compose to reflect the new version

5. Stop the containers and start the new ones

	`# docker-compose stop`
	`# docker-compose up -d`
