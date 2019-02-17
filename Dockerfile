FROM mysql:5.7

# Specifies which repo and version to pull
ARG GUAC_REPO=apache/guacamole-client
ARG GUAC_VERSION=1.0.0

# Grab DB schema files
ARG BASE_URL=https://raw.githubusercontent.com/${GUAC_REPO}/${GUAC_VERSION}/extensions/guacamole-auth-jdbc/modules/guacamole-auth-jdbc-mysql/schema/
ADD ${BASE_URL}001-create-schema.sql /docker-entrypoint-initdb.d/
ADD ${BASE_URL}002-create-admin-user.sql /docker-entrypoint-initdb.d/

# Run script before schema and set DB name from env
RUN echo 'sed -i "1i USE $SQL_DATABASE;" /docker-entrypoint-initdb.d/*.sql' > /docker-entrypoint-initdb.d/000-use-database.sh

# Open permissions
RUN chmod 777 -R /docker-entrypoint-initdb.d/
