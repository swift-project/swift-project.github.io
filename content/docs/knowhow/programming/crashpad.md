---
title: Crashpad
---

= Introduction =

Crashpad is a library for capturing, storing and transmitting postmortem
crash reports from a client to an upstream collection server. Crashpad
aims to make it possible for clients to capture process state at the
time of crash with the best possible fidelity and coverage, with the
minimum of fuss.

Crashpad also provides a facility for clients to capture dumps of
process state on-demand for diagnostic purposes.

Crashpad additionally provides minimal facilities for clients to adorn
their crashes with application-specific metadata in the form of
per-process key/value pairs. More sophisticated clients are able to
adorn crash reports further through extensibility points that allow the
embedder to augment the crash report with application-specific metadata.

More information can be found under
\[\[<https://chromium.googlesource.com/crashpad/crashpad/+/master/doc/overview_design.md>
\| Crashpad Overview Design\]\]

= Supported Platforms =

Currently Crashpad supports Windows and Mac OS only. On Windows, the
supported compiler is MS Visual Studio. MinGW is not supported.

= *swift* Infrastructure =

== Crash Handler ==

Crashpad is automatically linked and activated with a release build of
*swift*. A standalone executable called
[swift\_crashpad\_handler]{.title-ref} is monitoring each *swift*
executable. [swift\_crashpad\_handler]{.title-ref} will collect process
information including a full stack trace, in case of a abnormal abort.
The collected information is automatically written into a minidump file
and uploaded to <https://swift-project.sp.backtrace.io>

== *swift* Breakpad Server ==

*swift* Breakpad Server is our fork of \"Simple Breakpad Server\". This
fork is currently hosted at
<https://github.com/emiro85/simple-breakpad-server> The implementation
is based on nodejs. It accepts minidump crashreports and symbols files
needed to create a readable stack trace. Symbol files are automatically
uploaded from a Jenkins Release build.

== Produce Stacktrace Manually ==

In case a crash dump was uploaded without its corresponding symbol files
(e.g. from a non-release Jenkins job), the stack trace can also created
locally. This requires the following:

> \# **Symbol files:** Either download them from the Jenkins job (be
> careful since only the latest artifacts are kept. As soon as the job
> runs again, the artifacts are lost). Extract it. \# Download
> executable [minidump\_stackwalk]{.title-ref} \#\# Windows: Link TBD
> \#\# Mac OS: Link TBD \# Download the dump file from Breakpad Server
> if you don\'t have it locally already

Run the command in a terminal: [minidump\_stackwalk \<path to dump
file\> \<path to symbol files\> \> stacktrace.txt]{.title-ref}
