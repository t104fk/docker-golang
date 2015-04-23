FROM registry:latest
COPY config.yml /tmp/registry/config.yml
ENV SETTINGS_FLAVOR=local
ENV SEARCH_BACKEND=sqlalchemy
ENV DOCKER_REGISTRY_CONFIG=/tmp/registry/config.yml
EXPOSE 5000
