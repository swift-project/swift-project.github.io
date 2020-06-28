---
title: Jenkins Download
---

## Legal

By downloading Jenkins builds you agree with the sift legal terms
outlined [here](https://datastore.swift-project.org/page/legal.php).

## Background

swift installer is being built autonomously via Jenkins Continuous
Integration (<https://build.swift-project.org>). For every published
change a set of per-configured tasks called jobs is executed to test for
build errors, run unit tests and produces a new installer. Usually at
the end of a development cycle, those installers will be made available
to the different release channels. But it might also be necessary to
directly download from Jenkins for short test and fix cycles.

{{% alert title="Important" color="primary" %}}
Installing from Jenkins is a bit different than via the official release
channels. The differences will be explained here.
{{% /alert %}}

## Prerequisites

While we are in a closed testing phase, all installer downloads are
restricted. This means, an extra account to log into Jenkins is
required. Anonymous download is not possible. As soon as you received
your login details, log yourself in and change your password. This can
be done either by clicking on the small arrow next to your name after
login.

or simply by using the url
<https://build.swift-project.org/user/>\<username\>/configure. Don\'t
forget to replace \<username\> with your actual user name.

## Downloading the Installer
The different jobs listed in Jenkins have a very specific pattern, which
can look confusing to someone not being used to the development process
of swift. Jobs are created, modified and deleted on a daily basis. But
the good news is, that as tester, you don\'t need to know which job will
have the installer for you to test. The developer will either tell you
the job name or pass you directly the link to the download.

The link will usually guide you to the jobs archived artifacts (file
names are examples only and might change):

| Artifact                                       | Description                      |
|------------------------------------------------|----------------------------------|
| swiftinstaller-windows-64-0.8.4.806011712.exe  | swift installer                  |
| swiftsymbols-windows-64-0.8.4.806011712.tar.gz | Symbols package (can be ignored) |
| xswiftbus-windows-64-0.8.4.806011712.7z        | XSwiftBus X-Plane Plugin         |


swift installer is required for everyone. XSwiftBus is only necessary if
you are going to use X-Plane. Note that this version of X-Plane only
contains the so called thin plugin. So only the binaries for a specific
toolset of compiler, architecture and OS, e.g. only MSVC Windows 64 bit.

- so you go from the start page to the relevant version.
- then the build number, \"red\" dots mean the build failed
- then you see the installer

## Installation

For *swift* itself, the install process is not different compared to the
release channels. The major difference is that, xswiftbus is not
downloaded automatically for you, but you need to extract and copy the
downloaded XSwiftBus package content yourself into the path
`<X-Plane Root>/Resources/plugins/xswiftbus`

## Updating

It is always recommended to uninstall the previous version of swift
before installing the new version. All data and settings will be kept as
long as you install in the same directory. See also
`copyswiftdata`{.interpreted-text role="ref"}
