---
title: Running a distributed swift (remote core)
---

{{% alert title="Warning" color="primary" %}}
There is also a YouTube video about this, see [here]({{< ref "tutorials" >}})
{{% /alert %}}

## Overview

*swift* can be run distributed. That means the core (see [swift core]({{< ref "core" >}})) and the GUI (*swift* front end)
are split up. A normal scenario would be to run the core on the same
machine where the flight simulator (e.g. XPlane) is started, and the UI
runs on a second (remote) computer. However, you can also run core and
(distributed) UI on the same machine.

As you can see in the launcher you have 3 options:

![image](http://img.swift-project.org/Launcher_core_modes.png)

`Standalone`: This means swiftguistd is running standalone and includes
swift core. No other application needs to be started. **Don\'t start
swiftcore as extra process in that case**.

`GUI and Core - Audio on GUI side`: Use this configuration, if you want
to run gui and core in separate applications (possibly also on two
different machines in the network). All Audio (inkluding VATSIM voice)
will stay within the **GUI** process.

`GUI and Core - Audio on Core side`: Use this configuration, if you want
to run gui and core in separate applications (possibly also on two
different machines in the network). All Audio (inkluding VATSIM voice)
will stay within the **core** process.

## How to run swift on two different machines in the network

### Prerequisites

-   core and UI must be of the same version, do not mix different
    versions
-   Both machines need a stable network connection and DBus connections
    between the two machines need to be possible (check firewall
    settings etc.)

![image](http://img.swift-project.org/Allow_access.png)

### Instructions

1.  Launch swift launcher on core machine first. **Select Core mode
    \"GUI and core\"** depending on which machine you want audio.
2.  Select **DBus peer to peer server** and select the **LAN IP**
    interface from the combobox that is reachable from the GUI machine.
    For example 127.0.0.1 would not be reachable. 192.168.0.100 would be
    in some case. This is the IP core will be listening on. **It is very
    important to not use session server** in that case since session
    server is limited to local machine connections only.
3.  Launch swift launcher on GUI machine. Select t\**he same core
    mode*\* as you selected on the core machine.
4.  Select again\*\* DBus peer to peer server\*\* and type in the **LAN
    IP address** you selected in step 2. GUI will try to connect now to
    core.

As an alternative, one can use link[command line arguments]({{< ref "swiftcmdargs" >}}) to setup shortcuts to launch GUI and core more quickly.
*swift* launcher does the same (calling GUI and core process with
specific arguments).

### What happens where?

1.  model matching \"runs\" in the core, there your model set needs to
    reside
2.  GUI needs no model set, it will use the one from the core
3.  Core talks to the flight simulation network, so the connection from
    that machine to VATSIM (FSD server) needs to be enabled
4.  Core is connected to the simulator (e.g. by SimConnect, or
    XSwiftBus)
5.  Core and GUI talk to each other on the port set in the DBus settings
    (do NOT confuse this connection with the XSwiftBus connection)
6.  Audio can run on either side, and requires the AFV port enabled to
    the Internet

## Simulator on a different machine


As an alternative to running core on the simulator machine, one can also
setup a connection to a simulator in local network.

In order to create the model set in those scenarios you need remote
access (shared drive etc.) to the model directory.

### FSX/P3D

*swift* using a remote SimConnect configuration: See [here]({{< ref "p3dremote">}}). This allows to connect a remote FSX/P3D from a standalone *swift* GUI.

So there are two ways to setup a distributed scenario

- Distributed *swift* UI on computer 1, *swift* core on computer 2 (where the simulator runs) and core using a local `SimConnect` connection.
- Standalone *swift* UI on computer 1, connected via a remote `SimConnect` to computer 2. **No core**!

### FS9

You can also use `WideFS` for remote connection, and run *swift* as
standalone GUI. Same as with `SimConnect`. Also the
`DirectPlay` connection needs to be setup for remote access.
