---
title: 'FSX/P3D SimConnect\_AICreateNonATCAircraft fails, models are not
  rendered'
---

`SimConnect` (communication between *swift* and FSX/P3D) knows two ways
to add an aircraft, see [P3D
docu](https://www.prepar3d.com/SDKv4/sdk/simconnect_api/references/simobject_functions.html#SimConnect_AICreateNonATCAircraft).

-   `SimConnect_AICreateNonATCAircraft`: The
    SimConnect\_AICreateNonATCAircraft function is used to create an
    aircraft that is not flying under ATC control (so is typically
    flying under VFR rules).
-   `SimConnect_AICreateSimulatedObject`: The
    SimConnect\_AICreateSimulatedObject function is used to create AI
    controlled objects other than aircraft

The normal way to create our aircraft is via
`SimConnect_AICreateNonATCAircraft` and works by far for the most AI
aircraft. However, some helicopters etc. can only be added as
`SimConnect_AICreateSimulatedObject`.

Unfortunately this varies over the version (so it might work as
\"NonATC\" for P3D, but fails for FSX. So we use trial and error here,
if the model fails the first time with \"NoATC\", we use \"Simulated
object\". This was not worth mentioning it if both version would behave
the same.

-   But aircraft added as \"NoATC\" **will not show in the aircraft view
    menu,** so you cannot follow those.
-   Also aircraft parts cannot be set on those.

As a result some people do not like to use
[SimConnect\_AICreateSimulatedObject]{.title-ref}. You can control that
by the simulator settings.

![image](http://img.swift-project.org/SimulatedObject.png)

We recommend:

-   keep that off until you see that issue

-   then you have two options

    > -   enable it and use such aircraft via
    >     `SimConnect_AICreateSimulatedObject`, but not seeing them in
    >     the menu.
    > -   replace them in the model set by AI aircraft which work.
