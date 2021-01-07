+++
title = "bash script for gopro session5"
description = ""
tags = [
    "projects",
    "ffmpeg",
    "gopro"
]
date = "2018-06-28"
categories = ["projects",
              "ffmpeg",
              "gopro"]
draft = false 
+++

Script is a modified version of https://github.com/KonradIT/gopro-linux:

    function convert(){
        for i in *.MP4;
          do name=`echo $i | cut -d'.' -f1`;
          echo $name;
          ffmpeg -i $i -strict -2 -vcodec libx264 -crf 20 -s 1280x720 $name.mp4
        done
    }
