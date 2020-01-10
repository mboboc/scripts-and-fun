# scripts-and-fun
Useful stuff.

## How to connect to UPB cluster
username@fep.grid.pub.ro
`ex: ssh madalina.boboc@fep.grid.pub.ro`

If you want to make an instance for a virtual machine there is a tutorial [here](https://cloud.curs.pub.ro/about/tutorial-for-students/).

Then to access it:
`ssh -i ~/.ssh/openstack.key student@10.9.x.x`

## SCP command

#### download

`scp student@host:host-file-10M.dat . `

#### upload

`scp blue-file-10M.dat student@host:\path\to\dir`

## Other ways to tranfer data

#### direct
server: opens TCP server that listens on port 12345, it stays open waiting for a client

`nc -l 12345 > file-100M-nc.dat`

client: make a client and connect to server

`/usr/bin/time -v cat file-100M.dat | nc host 12345`

## Set connectivity between two stations

#### set ip address

`ip address add 192.168.0.1/24 dev veth-red`

#### activate interface

`ip link set dev veth-red up`

delete configurations:

`ip address flush dev INTERFACE`

check if config is okay with:

`ip address show dev veth-red`

`ip link show dev veth-red`

#### set default gateway

`ip route add default via 10.10.10.1`

check if config is okay with:

`ip route show`

#### activate routing on host

`sysctl -w net.ipv4.ip_forward=1`

#### NAT translation

`iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE`


## Persistent configurations
For persistent configurations we write the commands in files. To activate de configs the interfaces need to be restarted:

`ifdown INTERFACE`

`ifup INTERFACE`

## Firewall options using iptables

* telnet => port TCP 23
* SSH => port TCP 22
* FTP => port TCP 21

ex: `iptables -A FORWARD -d green -p tcp --dport telnet -j REJECT` # block telnet packets with destination = green 

ex: `iptables -A FORWARD -s red -j REJECT` # block all traffic from red

ex: `iptables -A FORWARD -d green -p tcp --dport ssh -j DROP` # block ssh

ex: `iptables -A FORWARD -d green -p tcp --dport ftp -j DROP` # block ftp

ex: `iptables -A FORWARD -s red -d green -p tcp --dport ssh -j ACCEPT` # accept ssh traffic

#### option:

`-A`: append, adds at the end of table

`-D`: delete, deletes from table

`-I`: insert, inserts in table

#### choose table:

`FORWARD` the rules is applied on packets that will be routed

`INPUT` the rules is applied on packets that will be sent directly to system

`OUTPUT` the rules is applied on packets that leave the system

#### matching:

`-d green`: packets with destination = green

`-s red`: packets with source = red

`-p tcp`: TCP packets;

`--dport telnet`: destination port is telnet port (= 23, you can find it in /etc/services)

#### action:

`-j REJECT`: reject packet

`-j ACCEPT`: accept packet
   
`-j DROP`: drop packet

#### flush table

`iptables -F FORWARD`

#### check FORWARD table:

`iptables -L FORWARD -v -n`

## SSH
All public key on a remote station are placed in `~/.ssh/authorized_keys`

#### Generate ssh keys

`ssh-keygen -t rsa`

#### Copy .pub key on remote station 

`ssh-copy-id student@host`

#### Command for corect permission on .ssh:

`chmod 755 /home/ana/.ssh/`

#### SSH config

`~/.ssh/config`

Host r

<tab> User student
  
<tab> HostName red
