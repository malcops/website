---
title: build yocto image for beaglebone black
author: Paul
date: '2022-02-02'
summary: ' '
description: ' '
draft: false
toc: false
readTime: true
autonumber: true
math: false
tags:
- development
- projects
showTags: false
hideBackToTop: true
---

1. SCP libsodium and and stable version of ZMQ to the Beaglebone
+ For both libsodium and ZMQ, run:

<!-- code block -->
    mkdir -p yocto-bb && cd yocto-bb
    git clone -b thud git://git.yoctoproject.org/poky.git
    source poky/oe-init-build-env build

Uncomment the following line in local/local.conf:

<!-- code block-->
    MACHINE ?= "beaglebone-yocto"

A couple other changes were necessary. The 'CONNECTIVITY_CHECK_URIS' option was needed to
solve an error reaching out to https://www.example.com, this will now check using Google instead.

'BB_NUMBER_THREADS' reduces the number of build threads.

<!-- code block-->
   CONNECTIVITY_CHECK_URIS="https://www.google.com"
   BB_NUMBER_THREADS="4"

Finally, build the image:

<!-- code block-->
    bitbake core-image-minimal

