---
title: Flightgear
weight: 9
---

## Initial Configuration

After the installation completed, *swiftlauncher* will launch together
with the initial configuration wizard. If you un-selected to launch
swift from the installer, it is possible to run the same init mode any
time later by using the command line arguments

`swiftlauncher -i --bootstrapurl https://datastore.swift-project.org/shared/`

The rest of the section will guide you through the different wizards.

## Legal Wizard

The first wizard page deals with the necessary legal bits. It will
explain in detail all the licenses involved in the swift project
including 3rd party software. It also provides links to data protection
policies. It is necessary to accept license and data protection policy
to proceed. This page also asks for your agreement to submit crash
reports to our crash report collection server. In case any *swift*
application crashed, a crash report will be generated with information
which line of code caused it to abort. With your agreement, the report
will be uploaded to our server and helps the developers to diagnose and
fix the cause. This agreement can be changed anytime later in the
advanced settings (link tbd). Read more about crash reports (link tbd)
and how they look like.

## Data Loading Wizard

The next wizard will download all data, required by *swift* to be fully
functional. This includes aircraft and airline ICAO data, model strings
(**no models itself**), etc. **It is not necessary to click any of the
load buttons**. The download will start automatically from randomly one
of the shared mirror servers in the background. The button can be used
to reload in case there was an update meanwhile. You can either wait for
the download to finish (several seconds depending on your internet
bandwidth) or continue, since it will continue in the background. The
wizard indicates that all data finished loading by

-   The two DB LEDs flashing yellow
-   All other LEDs off (idle mode).
-   The number of entries and the timestamp of the local cache are equal
    to the shared cache.

## Copy Models Wizard

{{% alert title="Note" color="primary" %}}
If you installed *swift* the very first time on this machine, then you can skip this part.
{{% /alert %}}

If you had a previous version of swift installed already, then this
wizard will help you to migrate your existing model cache and model set.

-   Select the older version you want to migrate from the list.
-   Select whether you want to migrate the model set and/or model cache
    and for which simulators.
-   Click Start.

Read more about the meaning of model set (link tbd) and model cache
(link tbd).

## Copy Settings Wizard

{{% alert title="Note" color="primary" %}}
If you installed *swift* the very first time on this machine, then you
can skip this part.
{{% /alert %}}

If you had a previous version of swift installed already, then this
wizard will help you to migrate your settings.

- Select the older version you want to migrate from the list.
- Select which settings needs migrating
    - Grey X means that no user setting is available and the default is in use.
- Click copy

Read more about settings (link tbd).

## Simulator Wizard

This page allows you to configure which simulators you want *swift* to
work with. If you have multiple simulators installed and use them
regularly, select all of those in the first group box. *swift* will
detect if any of those configured simulators is running and connect to
it. It will ignore the ones that have not been selected.

In the group box below, you are able to configure the simulator path and
any additional model directories. *swift* will try to detect as much as
possible automatically and use it as default. The default is listed in
light grey. In order to configure the directories, first select the
respective simulator from the radio boxes at the bottom

![image](http://img.swift-project.org/radiobox_sim.png)

-   Use the `...` button to select/add more directories
-   Use the `adjust` button to remove redundant directories, fix file
    path etc.
-   Click [Save]{.title-ref}

![image](http://img.swift-project.org/setup_simulator.png)

{{% alert title="Important" color="warning" %}}
If you are using P3D and you are using models outside the `SimObjects` folder you can add multiple other directories here.
{{% /alert %}}

## First Model Set Wizard

This wizard will help you to create a first model set for each of your
simulators in use. A model set is a subset of the AI models installed on
your machine, which are considered for model mapping and model matching.
Without any model set, *swift* will not run properly.

- Select your simulator (repeat the steps below if you are using multiple simulators).
- Check the model directory and change it if necessary.
- Reload the installed AI models if necessary. This is necessary in case the number of models does not look correct to you or if you made any changes to model directories in this or the previous wizard.
- Optionally display and inspect the model list

![image](http://img.swift-project.org/firstmodelset.png)

- Click on `Create` to create a model set.
- **Save** the model set.
- Close the dialog

![image](http://img.swift-project.org/ownmodelsetdialog.png)

## Configure Hotkeys Wizard

The last wizard allows you to configure hotkeys. Use this to configure
your PTT key.

![image](http://img.swift-project.org/hotkey_setup.png)

## Run *swift*

Your *swift* suite is now configured and ready to go. Use the launcher
to launch the different swift applications in different flavors and
modes. For first time users, it is recommended to start swift in
standalone mode. \* In the core tab, select Core Mode `Standalone` \*
Click on the blue swift icon named `GUI` to start swift in standalone
mode.

## Congratulations
*swift* is now running on your machine and you are
ready to setup everything else for your first connection to the network.

Something didnt work?

-   Use the `useswiftchecklist`{.interpreted-text role="ref"}
-   Check our `troubleshooting`{.interpreted-text role="ref"} page or
    ask for help in the usual channels.
