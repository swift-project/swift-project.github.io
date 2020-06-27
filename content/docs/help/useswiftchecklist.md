---
title: 'Checklist: Check before your 1st flight'
weight: 1
---

## General (all simulators)


- [ ] Have you installed the models for multiplayer aircraft? [See here]({{< ref "downloadmodels" >}})
- [ ] If not done during the launcher wizard, [create a model set]({{< ref "createms" >}}) for your simulator in use.
- [ ] It not done during the launcher wizard, [define a PTT key]({{< ref "definehotkey" >}})
- [ ] [Enable crashdump reports]({{< ref "crashreports" >}}) so developers can analyze the cause of crashes better.
- [ ] Close other pilot clients, so the voice port is not blocked.
- [ ] Do not touch the gnd.flag and fast position settings unless you know what you are doing!
- [ ] Do not run *swift* core and **standalone** GUI on the same machine, you can run core+remote UI. But normally core is only needed for [distributed swift]({{< ref "distributedswift" >}}).
- [ ] Do you see **validation errors**? If you see multiple validation, something in your setup is wrong: [see here]({{< ref "whyvalidationerrors" >}}).
- [ ] Make sure malware protection allows swift to run, recently users reported issues with TrueImage Active protection.

## OS specific

### macOS: 
- [ ] Enable the microphone for *swift*, see [here]({{< ref "macosnosound" >}})

### Windows
- [ ] make sure swift can access your microphone, [see here]({{< ref "nomiconwindows" >}})

### Linux 
- [ ] Hotkeys: We read keyboard and joystick stuff from `/dev/input/event*` and `js*`. Those files have to be readable by your user. Typically they are owned by group input or such so if you add your user to that group then it will work.

## XPlane

*swift* has not yet been adapted to use Vulkan. If you have enabled
Vulkan then you won\'t see any aircraft.

- [ ] use the 64bit version

- [ ] make sure `XSwiftBus` is installed, and it is the correct version `XSwiftBus` and swift client require to **have the same version**)

- [ ] Make sure other pilot clients are uninstalled (as those most likely interfere with *swift*). Disabling the plugins might me NOT enough, remove them from the plugins folder.

- [ ] CSL files need to be inside the `XPlane` folder, it is advisable to avoid spaces and special characters in the file paths

- [ ] disable other simulator plugins using multiplayer planes (such as other pilot clients, or traffic tools) may conflict with *swift*. Or entirely move them out of the plugin folder if you have problems such as not working animations (gear down), see [here]({{< ref "troubleshooting" >}}) under XPlane.

- [ ] for `BlueBell` models apply the vertical offset fix (make
sure to do this correctly and NOT ending up with cascaded directories)

- see [Bluebell CSL and Vertical Offset Fix]({{< ref "downloadbluebell" >}}),
- [troubleshooting]({{< ref "troubleshooting" >}}) and
- [XPlane Aircraft too high or too low]({{< ref "xplanecg" >}})

## P3D/FSX

- [ ] use the 32bit version for FSX, the 64bit version for P3D.

- [ ] P3D: to use external model directories (not in `SimObjects`)
add this directory

- [ ] FSX: make sure the terrain probe is installed, see [Installation of the FSX/P3D terrain probe]({{< ref "fsxprobe" >}})

- [ ] Enable [SimConnect SB4 offsets settings]({{< ref "sbareasettings" >}}) in the driver
settings if you want to use XPDR updates from PMDG and other aircraft

- [ ] If you cannot connect swift/P3D (FSX): If you run P3D/FSX as \"Admin\", run *swift* as \"Admin\"

## FS9

- [ ] make sure FSUIPC is installed, *swift* needs FSUIPC to work properly

- [ ] If you run FS9/FSUIPC as \"Admin\", run *swift* as \"Admin\"

- [ ] Since Windows Update 1909 the auto connect to the simulator does NOT
work anymore, see [Connecting FS9 manually through multiplayer]({{< ref "fs9mp" >}})

- [ ] Consider the gnd. elevation recording: [FS9 elevation]({{< ref "fs9elevation" >}})

## Check the connection of *swift* with your simulator

If *swift* is connected with your simulator, you shall see the simulator
LED as on

![image](http://img.swift-project.org/swift_LED_bar.png)

If NOT, make sure your simulator driver is enabled, see [Configure / select the used simulator, P3D version FSX version]({{< ref "configuresim" >}})

If the simulator does NOT connect, sometime it helps to un-check and
check again the simulator (simulator settings)

Simulator disconnects: Do not run core and standalone GUI at the same
time.

For XPlane:
- If no connection, check that the *XSwiftBus* on simulator side and *swift* side do match: [XSwiftBus settings]({{< ref "xswiftbussettings" >}})

For FSX/P3D

- For P3D x64 check the correct P3D version: [Setting the correct P3D version (x64 only)]({{< ref "p3dversion" >}})