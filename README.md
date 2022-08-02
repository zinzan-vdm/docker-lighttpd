# lighttpd - lighty

This is just a dockerized image with defaults providing the bare necessities to get an instance of lighty running and serving some static files.

https://www.lighttpd.net/

Borrows a lot from https://github.com/jitesoft/docker-lighttpd.

## Usage

The server will bind to port 80 and serve static files from `/var/www/html/` (`LIGHTTPD_SERVER_ROOT`) by default.

### Environment Variables
| Key | Default | Description |
| -- | -- | -- |
| LIGHTTPD_PORT | '80' | The port to listen on. |
| LIGHTTPD_SERVER_NAME | 'localhost' | The name of our server, templated into the default config (`./configuration/lighttpd.conf`). |
| LIGHTTPD_SERVER_ROOT | '/var/www/html/' | The directory to serve static files from. |
| LIGHTTPD_CONFIG_FILE | '/etc/lighttpd/lighttpd.conf' | The configuration file to run lighty with. The default config is templated from `./configuration/lighttpd.conf` |
| LIGHTTPD_MAX_FDS | '1024' | Maximum number of file descriptors. For high load, you might want to increase this number. |
