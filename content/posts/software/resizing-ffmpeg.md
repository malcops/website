---
title: resizing images using ffmpeg
author: Paul
date: '2018-06-22'
summary: ' '
description: ' '
draft: false
toc: false
readTime: true
autonumber: true
math: false
tags:
- development
- ffmpeg
- projects
showTags: false
hideBackToTop: true
---

Photos taken with GoPro Session5 have resolution 1334x750 and file size of 2.1MB.

Photos taken with iPhone 6s have resolution 4032x3024 and file size of ~3.1MB.

Setting image width to 1080, and maintaining the same aspect ratio produces
a nice looking image for the blog, with a manageable file size:

    ffmpeg -i input.png -vf scale="1080:-1" output.png

For GoPro photos, the output has a resolution 1080x607 and file size of ~121kB, saving 94% of space.

For iPhone photos, the output has a resolution 1080x810 and file size of ~127kB, saving 96% of space. 



