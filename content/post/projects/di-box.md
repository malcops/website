+++
title = "diy di (direct input) box"
description = ""
tags = [
    "music",
    "development",
]
date = "2020-02-22"
categories = []
draft = true
+++

## Background


https://nextgenguitars.ca/pages/whats-new.htmlbuild-your-own-passive-di-box-video-included/



The main component (and largest expense) for this project is the transformer, a Hammond 1140-DB.
https://www.hammfg.com/files/parts/pdf/1140-DB-A.pdf

Parts list:
1x Hammond 1140-DB transformer
1x aluminum Hammond project box
2x 1/4 mono jacks
1x SPST switch
1x XLR jack (double check male/female??)
hookup wire (various colours)

Equipment list:
Soldering iron
Cordless drill
Step drill bit (optional)

## Assembly

A step drill bit was a worthy investment for drilling holes in the project box. I figure I'll
get enough use out of it for similar projects to justify the expense.

<!-- add image -->
![caption text](/img/waterfall.PNG)

## Circuit Simulation

The circuit itself is pretty straightforward. The input signal passes through the isolating transformer.
The output is two audio signals of opposite polarity.

<!-- add image -->
![caption text](/img/waterfall.PNG)

The low output impedance of the transformer means adequate signal will arrive wherever it's plugged in (e.g. the mixer).


