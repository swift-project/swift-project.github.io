---
title: Setting input device permissions / Creating an udev rule
---

By default your distro (hopefully) has read/write access to the input
devices disabled on user accounts. If these were allowed it would be a
tremendous security hole, as any user on the system could see every
input event (including keyboard events such as you typing your banking
password, etc).

One may be inclined to run swift as root, or to
`chmod 777 /dev/input/event*`, however this is not advisable for the
aforementioned reasons.

The approach we will take is to create an co\`input\` group, add
yourself to it, and then create a udev rule that provides the necessary
settings.

Creating an Input Group
=======================

This is simple stuff. Create a group and add yourself to it:

``` {.}
sudo groupadd input
sudo gpasswd -a username input
```

Now log out of your shell, and log back in, so that you are part of the
input group. You can verify that the change took place by running the
`groups` command.

Creating a udev Rule
====================

Unfortunately this may vary by distro, however the concepts will likely
be exactly the same or highly similar - this method is known to be true
for openSUSE. You need to locate the udev rules.d directory, which is
usually in [/etc/udev/rules.d]{.title-ref}. Next create a rule file for
the input device nodes. Your distro may already have a rule file for
this purpose, however we still want to create our own since their file
may get replaced during a distro upgrade. Make sure that the new file
has a priority higher than that of any other file with an event rule in
it. For example as root, create the file
\`/etc/udev/rules.d/99-input.rules\`:

``` {.}
KERNEL=="event*",       NAME="input/%k", MODE="660", GROUP="input"
KERNEL=="js*",          NAME="input/%k", MODE="664", GROUP="input"
```

In Ubuntu, you need to add colons like this:

``` {.}
KERNEL=="event*",       NAME="input/%k", MODE:="660", GROUP="input"
KERNEL=="js*",          NAME="input/%k", MODE:="664", GROUP="input"
```

Then you just need to reload udev rules so that the permissions get
updated.

``` {.}
udevadm control --reload-rules
udevadm trigger
```

Note that on my system, reloading udev had no effect. I ended up having
to reboot, which did the trick. If anyone knows of a way to make the
changes take place without a reboot, please fix this section!

Now check the permissions on `/dev/input/event*` and verify that the
group ownership on the device nodes are set to \`input\`:

``` {.}
$ ls -al /dev/input/
total 0
drwxr-xr-x  4 root root     440 Jun  6 12:32 .
drwxr-xr-x 21 root root    4480 Jun 10 09:00 ..
drwxr-xr-x  2 root root     120 Jun  6 12:32 by-id
drwxr-xr-x  2 root root     140 Jun  6 12:32 by-path
crw-rw----  1 root input 13, 64 Jun 10 09:00 event0
crw-rw----  1 root input 13, 65 Jun 10 09:00 event1
crw-rw----  1 root input 13, 74 Jun 10 09:00 event10
crw-rw----  1 root input 13, 75 Jun 10 09:00 event11
crw-rw----  1 root input 13, 76 Jun 10 09:00 event12
crw-rw----  1 root input 13, 77 Jun 10 09:00 event13
crw-rw----  1 root input 13, 78 Jun 10 09:00 event14
crw-rw----  1 root input 13, 79 Jun 10 09:00 event15
crw-rw----  1 root input 13, 66 Jun 10 09:00 event2
crw-rw----  1 root input 13, 67 Jun 10 09:00 event3
crw-rw----  1 root input 13, 68 Jun 10 09:00 event4
crw-rw----  1 root input 13, 69 Jun 10 09:00 event5
crw-rw----  1 root input 13, 70 Jun 10 09:00 event6
crw-rw----  1 root input 13, 71 Jun 10 09:00 event7
crw-rw----  1 root input 13, 72 Jun 10 09:00 event8
crw-rw----  1 root input 13, 73 Jun 10 09:00 event9
crw-r-----  1 root root  13, 63 Jun 10 09:00 mice
crw-r-----  1 root root  13, 32 Jun 10 09:00 mouse0
```
