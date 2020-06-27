---
title: Installation of the FSX/P3D terrain probe
---

For the 32bit P3D/FSX driver it is recommended to install the FSX
terrain probe. The probe allows to query simulator data around your AI
aircraft.

::: {.important}
::: {.title}
Important
:::

The probe needs to be installed before you run FSX/P3D
:::

There are 3 ways to install the probe:

-   From the settings simulator \"plugin configuration\":

![image](http://img.swift-project.org/Copy_probe_from_plugin_settings.png)

-   In the wizard:

![image](http://img.swift-project.org/Simulator_specific_wizard_page.png)

-   Or just copy it manually to `SimObjects/Misc` . The probe is located
    in your swift `share/simulator` directory

Testing the probe
=================

-   You should see the confirmation the probe is added (only for FSX/P3D
    32bit drivers)

![image](http://img.swift-project.org/logtab.png)

-   To fully test the probe, you can open the interpolation display
    `.drv intdisplay`

    > -   go to the elevation tab
    > -   click `own aircraft` which should set the coordinates of your
    >     own aircraft
    > -   click `set`. You should now see a response (2nd line)
    >     displaying the gnd. elevation (supposed to be your own
    >     aircraft\'s elevation - CG)
    >
    > ![image](http://img.swift-project.org/Interpolation_display_elevation.png)
