

+++
title = "setting up ssh on Beaglebone Black"
description = ""
tags = [
    "projects",
    "development",
]
date = "2019-02-22"
categories = []
draft = false
+++

paragraph

<!-- code block-->
    paul@thinkpad:~$ ifconfig -a
    enx40bd322369aa: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 40:bd:32:23:69:aa  txqueuelen 1000  (Ethernet)
        RX packets 43  bytes 10543 (10.5 KB)
        RX errors 3  dropped 0  overruns 0  frame 3
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

    paul@thinkpad:~$ sudo dhclient enx40bd322369a
    paul@thinkpad:~$ sudo ssh 192.168.7.2 -l root
    The authenticity of host '192.168.7.2 (192.168.7.2)' can't be established.
    ECDSA key fingerprint is SHA256:tZFGWno/Ov8GsCClKllYKc6vb2OTIyLSimCuLYJdPk4.
    Are you sure you want to continue connecting (yes/no)? yes
