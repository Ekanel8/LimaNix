#!/bin/bash

if sudo systemctl is-active wg-quick-bravo; then
    sudo systemctl stop wg-quick-bravo
else
    sudo systemctl start wg-quick-bravo
fi
