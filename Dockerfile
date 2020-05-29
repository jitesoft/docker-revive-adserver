# syntax=docker/dockerfile:experimental
FROM registry.gitlab.com/jitesoft/dockerfiles/php-fpm:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/revive-adserver" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/revive-adserver/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/revive-adserver" \
      com.jitesoft.app.revive.version="${REVIVE_VERSION}"


RUN --mount=type=bind,source=./revive,target=/tmp/revive \
    mkdir -p /var/www/html \
 && tar -xhzf /tmp/revive/revive.tar.gz -C /var/www/html --strip-components=1 \
 && php-ext install zip gd
