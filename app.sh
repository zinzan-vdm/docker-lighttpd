#!/bin/sh

set -e

if [[ -z "$@" ]]; then
  lighttpd -D -f "${LIGHTTPD_CONFIG_FILE}"
else
  lighttpd -D $@
fi
