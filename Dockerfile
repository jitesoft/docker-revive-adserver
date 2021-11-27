# syntax=docker/dockerfile:experimental
FROM registry.gitlab.com/jitesoft/dockerfiles/php/runtime/fpm:7.4
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
 && cp /tmp/revive/entrypoint /usr/local/bin/entrypoint-revive \
 && chmod +x /usr/local/bin/entrypoint-revive \
 && cp /tmp/revive/async.min.js /var/www/html/www/delivery/new-async.js \
 && cp /tmp/revive/conf.tmpl /usr/local/conf.tmpl \
 && chown -R www-data:www-data /var/www/html \
 && chmod -R a+w /var/www/html/var \
 && chmod -R a+w /var/www/html/plugins \
 && chmod -R a+w /var/www/html/www/admin/plugins \
 && chmod -R a+w /var/www/html/www/images

ENTRYPOINT ["entrypoint-revive"]
CMD ["php-fpm"]
