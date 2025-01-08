FROM quay.io/keycloak/keycloak:latest

# Copy custom themes to the appropriate location
COPY ./themes /opt/keycloak/themes

# Expose ports if needed (not required if using docker-compose)
EXPOSE 8080