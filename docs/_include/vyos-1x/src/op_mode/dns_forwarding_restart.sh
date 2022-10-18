#!/bin/sh

if cli-shell-api existsEffective service dns forwarding; then
    echo "Restarting the DNS forwarding service"
    systemctl restart pdns-recursor.service
else
    echo "DNS forwarding is not configured"
fi
