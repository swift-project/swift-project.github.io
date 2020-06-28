---
title: 'Why do I see a B74F instead of the B747 passenger version?'
---

FSD (\"the VATSIM protocol\") uses the aircraft and airline ICAO codes
to identify other pilot\'s aircraft. Unfortunately many use
pseudo/fantasy ICAO codes. Our source for ICAO codes is the official
ICAO database: `icaodb`{.interpreted-text role="ref"}

As an example let\'s look at the `B747`, as you can see neither `B747`
nor `B74F` are valid codes. That means, by using official ICAO codes
there is no way to distinguish a freight B747 from a combi or pax
version.

![image](http://img.swift-project.org/icaodb.png)

It is though possible to use different liveries to distinguish those
planes, e.g. by using the passenger and cargo livery for a very plane
(if there is any).

Unfortunately there is no standard at VATSIM of how liveries and ICAO
codes are are really to be used. Every client uses its own logic. For
instance *swift* \<-\> *swift* communication transfers more details, and
XSB has its own livery schema. But there is no standard.

If you want to achieve customized results in *swift* you have the
following options:

-   remove models you do not want to see from your model set
-   use matching script to write your own logic: `ms`{.interpreted-text
    role="ref"}
-   remove duplicates from your model set:
    `modelsetduplicates`{.interpreted-text role="ref"}
