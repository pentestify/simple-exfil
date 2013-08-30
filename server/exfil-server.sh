#!/bin/bash

# Clear all iptables rules
echo "Stopping firewall and allowing everyone..."
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# run the server daemon
ruby server.rb > server.log &

# Forward all ports to a single port (2000)
# http://superuser.com/questions/440324/iptables-how-to-forward-all-external-ports-to-one-local-port
echo "Forwarding all ports to port 2000"
iptables -t nat -A PREROUTING -p tcp --dport 0:55521 -j REDIRECT --to-ports 2000
iptables -t nat -A PREROUTING -p tcp --dport 55523:65535 -j REDIRECT --to-ports 2000

