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
