+++
title = "recompress a debian package"
description = ""
tags = [
    "software",
]
date = "2025-03-04"
categories = ["projects"]
draft = true
+++

In my case, I'm stuck on an outdated version of Artifactory that is unable to handle newer compression algorithms.
For in-house packages, it's easy enough to build everything with the right compression.


The steps are really quite simple:
 - decompress existing .deb
 - recompress into a new .deb, specifying the desired compression format (TODO)

To maintain appropriate file/folder permissions, everything is wrapped by 'fakeroot'.
```
fakeroot sh -c '
  mkdir tmp
  dpkg-deb -R original.deb tmp
  # edit DEBIAN/postinst
  dpkg-deb -b tmp <TODO compression flag> fixed.deb
'
```

Give the new package a new name - probably wise to add a suffix to the existing name (in my case ~companyname1).