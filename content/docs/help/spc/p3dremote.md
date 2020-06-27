---
title: P3D and FSX remote SimConnect access
---

::: {.important}
::: {.title}
Important
:::

Remote SimConnect allows you to run a \"standalone\" GUI connecting to a
remote FSX/P3D via a \"remote SimConnect\" configuration. This is
something different as a distributed *swift* GUI connected with a core.
:::

If you want to read about remote swift UI:
`distributedswift`{.interpreted-text role="ref"}

Enable the server side (where FSX or P3D runs)
==============================================

-   From the official [P3D
    documentation](https://www.prepar3d.com/SDKv4/sdk/simconnect_api/configuration_files/configuration_files_overview.html)
-   Another remote [SimConnect]{.title-ref} config [tutorial is
    here](https://www.fsdeveloper.com/wiki/index.php?title=Remote_connection).
-   In `%APPDATA%\Lockheed Martin\Prepar3D v4` (or `Microsoft/FSX`)
    create a `SimConnect.xml` file
-   Example: My path looks like this for FSX:
    `C:\Users\[username]\AppData\Roaming\Microsoft\FSX`
-   This file is only needed when remote access is required
-   For me the file is identical for P3Dv4 and FSX
-   In case one needs to create [SimConnect]{.title-ref} log files, the
    [.ini\`file is here: \`C:Users\[username\]DocumentsFlight Simulator
    X FilesSimConnect.ini]{.title-ref}

Example file: TODO ADD

Enable the client side (where *swift* runs)
===========================================

-   On the client machine, go to the `Documents` folder, something like
    this: `C:\Users\[username]\Documents`
-   In the documents folder place a `SimConnect.cfg` file corresponding
    with the above server

Example file: TODO ADD

You can alternatively use the config option from the *swift* settings

![image](http://img.swift-project.org/SimConnect_swift_config.png)

Logging SimConnect
==================

<https://forum.simflight.com/topic/45074-fsx-help-logging-simconnect/>
