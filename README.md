# Revive adserver

This image contains revive adserver and php-fpm.  
The current php version is php 7.4

Included in the build is a modified 'async.js' script, which uses events to check for DOM changes
allowing AD slots to be added _after_ loading the revive scripts.  
The new script is set to default async.js script in the dynamic configuration.  
To change to the default async.js file, set the `REVIVE_ASYNC_JS_SCRIPT` env 
variable to `async` (rather than default `new-async`).

### Configuration

For full configuration, create a domain specific configuration and mount it to the `/var/www/html/var/<domain>.conf.php`.  

The default configuration is modified by usage of environment variables. It will
be generated in the `/var/www/html/var/${REVIVE_DOMAIN}.conf.php` file in case
the file does not already exist (by mounting it).

Some variables have a default value, while most should be set to allow
the creation of the configuration.

The following variables are available:

`REVIVE_APPLICATION_NAME` (defaults to Revive)  
`REVIVE_COMPANY`  
`REVIVE_DOMAIN`  
`REVIVE_DB_HOST`  
`REVIVE_DB_PORT`  
`REVIVE_DB_USER`  
`REVIVE_DB_PASSWORD`  
`REVIVE_DB_DATABASE`  
`REVIVE_DB_TYPE` (defaults to mysqli)  
`REVIVE_DB_PREFIX` (defaults to rv_)  
`REVIVE_DELIVERY_SECRET` (defaults to random non crypto secure b64 string)  
`REVIVE_ASYNC_JS_SCRIPT` (defaults to new-async)  

For full configuration, check the [`conf.tmpl`](conf.tmpl) file.  
You can replace the conf.tmpl file by overwriting the `/usr/local/conf.tmpl` file with your own.

### Persist images

To persist uploaded images, mount the `/var/www/html/rv_images` directory.  
To persist plugins, mount the `/var/www/html/plugins` directory.

## Tags:

Images are built for amd64 and aarch64, versions are based on the version of revive as of the build time.

Images can be found at:

* [DockerHub](https://hub.docker.com/r/jitesoft/revive-adserve)
  * `docker.io/revive-adserver`
* [GitLab](https://gitlab.com/jitesoft/dockerfiles/revive-adserve)
  * `registry.gitlab.com/jitesoft/dockerfiles/revive-adserver`
* [GitHub](https://github.com/orgs/jitesoft/packages/container/package/revive-adserve)
  * `ghcr.io/jitesoft/revive-adserver`

## Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## License

The files in this repository are released under the [MIT license](https://gitlab.com/jitesoft/dockerfiles/php/blob/master/LICENSE).  
Revive adserver is released under [GNUv2](https://github.com/revive-adserver/revive-adserver/blob/master/LICENSE.txt).

## Sponsors

Sponsoring is vital for the further development and maintaining of open source projects.  
Questions and sponsoring queries can be made via <a href="mailto:sponsor@jitesoft.com">email</a>.  
If you wish to sponsor our projects, reach out to the email above or visit any of the following sites:

[Open Collective](https://opencollective.com/jitesoft-open-source)  
[GitHub Sponsors](https://github.com/sponsors/jitesoft)  
[Patreon](https://www.patreon.com/jitesoft)

Jitesoft images are built via GitLab CI on runners hosted by the following wonderful organisations:

<a href="https://www.linaro.org/">
  <img src="https://raw.githubusercontent.com/jitesoft/misc/master/sponsors/linaro.png" width="256" alt="Linaro logo" />
</a>
<a href="https://fosshost.org/">
  <img src="https://raw.githubusercontent.com/jitesoft/misc/master/sponsors/fosshost.png" width="256" alt="Fosshost logo" />
</a>

_The companies above are not affiliated with Jitesoft or any Jitesoft Projects directly._
