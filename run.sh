#!/bin/bash

/app/set_root_pw.sh
exec /usr/sbin/sshd -D &
