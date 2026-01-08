---
title: bash script for gopro session5
author: Paul
date: '2018-06-28'
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
- gopro
- projects
showTags: false
hideBackToTop: true
---

Script is a modified version of https://github.com/KonradIT/gopro-linux:

    function convert(){
        for i in *.MP4;
          do name=`echo $i | cut -d'.' -f1`;
          echo $name;
          ffmpeg -i $i -strict -2 -vcodec libx264 -crf 20 -s 1280x720 $name.mp4
        done
    }
