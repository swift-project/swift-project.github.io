---
title: swift installation with P3Dv4 and P3Dv5 versions in parallel
---

If you want to keep two versions of Prepar3D for online flying, a second
*swift* can be installed so both P3D versions can co-exists and have
independent model sets. This has been tested with
`swiftinstaller-window-64-0.9.4.276` with `P3Dv4.5` and
`swiftinstaller-window-64-0.9.4.366` for `P3Dv5 with Hotfix1`.

1.  Install a second *swift* by using different installation locations
    (directories). For example `swift-0.9.4-64bit_P4` and
    `swift-0.9.4-64bit_P5`.

2.  If you want to use the FLAi models for model matching:

    > 1.  Copy the folder FLAi with the `add-on.xml` from
    >     `Documents-Prepar3Dv4 Add-ons` to
    >     `Documents-Prepar3Dv5 Add-ons`.
    > 2.  Note: This is using the existing FLAi package on your
    >     computer, no new download necessary.

3.  For the new second *swift* installation for P3Dv5:

    > 1.  Start *swift* Launcher - Mapping Tool and create a new model
    >     set and press `save P3D`
    > 2.  Ensure the correct path to the P3D version, this is set in:
    >     Settings-\> Simulator basics. If necessary set it manually to
    >     `P3Ddv4` for the first and `P3Dv5` for the second one.

4.  To distinguish between the two *swift* versions, create
    `swiftguist.exe` links on the desktop, such as
    `swiftguist.exe Pv4.5` and the other one `swiftguist.exe Pv5`.
