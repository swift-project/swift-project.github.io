---
title: XPlane aircraft too high or too low (wrong offset/CG)
---

::: {.important}
::: {.title}
Important
:::

Whenever you change your model\'s folder (means remove it, move it etc)
you need to re-create your model set so the paths there reflect the real
situation, see `createms`{.interpreted-text role="ref"} .
:::

-   Bluebell CSL **models sunken in ground/too low** (vertical offset
    fix) -\> Solution: Install the `BB_IVAO_vert_offsets` fix
    (`downloadbluebell`{.interpreted-text role="ref"} ) (simply copy the
    files from the `BB_IVAO_vert_offsets` folder over the original ones)
    and restart X-Plane. **Make sure you install it correctly!** Do not
    end up in a cascaded structure, see next item.

-   If **all offsets for the BB models are missing**, check you haven\'t
    ended up if a cascaded directory structure and updated the offsets
    in the wrong place. This can easily happen if you click on the
    [rar]{.title-ref} file and extract to a different place. Make sure
    you only have one `xsb_aircraft.txt` per folder.

    > -   For an example see `installbb`{.interpreted-text role="ref"}
    >
    > -   Working folder example:
    >
    >     > ![image](http://img.swift-project.org/workingfolder.png)
    >
    > -   **WRONG** folder example, cascaded (\"Airbus in Airbus\")
    >
    > ![image](http://img.swift-project.org/cascadingfolder.png)
    >
    > -   **WRONG** folder example, offset file folder in `BB` folder
    >
    > ![image](http://img.swift-project.org/offsetwrongfolder.png)

-   If **some individual aircraft seem to be too high or low**, you can
    also check the vertical offset in the `xsb_aircraft.txt`

    > -   Normal Jets have values around 2-4 meters as value there, if
    >     you see values off the grid maybe this value is wrong
    > -   below you find some examples

``` {.}
OBJ8_AIRCRAFT A320_UAL
OBJ8 SOLID YES __Bluebell_Airbus/A320/A320_UAL.obj
VERT_OFFSET  3.5 <-- meters
AIRLINE A320 UAL

lOBJ8_AIRCRAFT B763_DAL
OBJ8 SOLID YES __Bluebell_Boeing/B763/B763_DAL.obj
VERT_OFFSET  4.44 <-- meters
AIRLINE B763 DAL

OBJ8_AIRCRAFT A306_UPS
OBJ8 SOLID YES __Bluebell_Airbus/A306/A306_UPS.obj
VERT_OFFSET 17.5 <-- UPS, extremely high
AIRLINE A306 UPS
ICAO A30
```

Checking in the pilot client
============================

You should see these values in the model view if everything is correctly
setup.

-   0 means a correct zero value
-   `null` means a value is not existing

![image](http://img.swift-project.org/cgcheck.png)

Really make sure that you look at the right thing, this is the path
where the model comes from. Check the corresponding `xsb_aircraft.txt`
file there if it really contains the value. Many people create their
model set from some weird place. If you change your paths, you need to
re-create your model set, see `createms`{.interpreted-text role="ref"}

![image](http://img.swift-project.org/xpmodels.png)
