---
title: Effectively and efficiently create mappings
---

First of all, swift mapping is about quality, not quantity. So just
create a mapping which is wrong is not the goal. However, there are some
tricks to speed up the mapping process.

Use pre-selected models
=======================

The process becomes much faster if you but models on the stash which
have something in common. That can be the \"distributor\", the \"ICAO
code\" or even multiple attributes.

Example:

-   Here I select all [B732]{.title-ref} of the [BVAI]{.title-ref}
    distribution. So I already know I will have only those models on the
    stash. Stash those

![image](http://img.swift-project.org/All_B732_BVAI.png)

-   Now on the stash, I select all of the, and assign [BVAI]{.title-ref}
    by pressing [distributor]{.title-ref} to all selected. So by one
    click, the distributor is set for all models.

![image](http://img.swift-project.org/BVAI_distributor.png)

-   Same for the aircraft ICAO, select [B732]{.title-ref}, [aircraft
    ICAO]{.title-ref}, and all models have the correct ICAO code

![image](http://img.swift-project.org/B732_ICAO.png)

-   With these 2 simple steps, you have fixed distributor and aircraft
    ICAO, now only the livery/airline is missing
-   Now we check the airlines one by one, remember it is about quality.
    A good share will already be correct.
-   Whenever I have found some correct ones, I select and publish them
    (small steps)

![image](http://img.swift-project.org/Published_models.png)

-   Then I remove them from the stash, so I have only those left which I
    still need to handle
-   After a few iterations I have one model left I still need to
    resolve. In my case [ModelConverterX]{.title-ref} could be used to
    check the model (what it really is)

![image](http://img.swift-project.org/Model_ConverterX.png)

-   If you are unable to resolve the livery, you can provide at [temp
    livery]{.title-ref}. This is a special livery for those aircraft
    still need a correct livery assigned. In such a case \"specialists\"
    can select those models and add. the missing information

![image](http://img.swift-project.org/Temp_livery.png)

Summary: This examples shows how you can quickly write mappings for a
larger number of aircraft. You do not need to follow each step, it is to
give you an idea about mapping techniques.

Using models of a arbitrary directory
=====================================

Maybe you want to download models and do the mappings **without**
installing them for your flight simulator. In that case you can use a
little trick and use `force reload from directory`

![image](http://img.swift-project.org/forcereload.png)

So when I install the [BVAI]{.title-ref} models (for example) in
`C:\temp\BVAI` I can load my own models from there. Then you can create
the mapping for those models without installing them into you flight
simulator directories.

![image](http://img.swift-project.org/Loading_from_directory.png)

Unfortunately you have to reload you simulator models again, if you want
to have those from the simulator back. But could also save the models to
a file (like for a backup), and later load them again.
