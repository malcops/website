---
title: recompress a debian package
author: Paul
date: '2025-06-20'
summary: ' '
description: ' '
draft: true
toc: false
readTime: true
autonumber: true
math: false
tags:
- development
- software
showTags: false
hideBackToTop: true
---

In my case, I'm stuck on an outdated version of Artifactory that is unable to handle newer compression algorithms.
For internally built packages, it's easy enough to build everything with the right compression. But for externally
built packages, this process could be useful. 

The steps breakdown like this:
 - decompress existing .deb
 - modify package name/information
 - recompress into a new .deb, specifying the desired compression format

To maintain appropriate file/folder permissions, everything is wrapped by 'fakeroot'.

For an example, consider a package named 'application_1.0-24.04_amd64.deb'.

```
fakeroot sh -c 'mkdir tmp; dpkg-deb -R application_1.0-24.04_amd64.deb tmp'
# edit tmp/DEBIAN/control with appropriate details
fakeroot sh -c 'dpkg-deb -b -Zxz tmp application_1.0-24.04~company001_amd64.deb'
```

Give the new package a new name - it's probably wise to add a suffix to the existing name, to indicate a new package (in my case ~company001).
