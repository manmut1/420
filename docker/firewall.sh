#!/bin/bash
ufw -f enable
ufw allow 80/tcp
   
ufw reload