#!/bin/bash
# print help message if invoked as root but exec command regardless
[ $UID -eq 0 ] && cat /USAGE

exec "$@"
