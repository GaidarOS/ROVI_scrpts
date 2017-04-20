#!/bin/bash

# Take the Ethernet iface down and then give it static IP
sudo ifconfig enp8s0 down
sudo ifconfig enp8s0 192.168.100.80
