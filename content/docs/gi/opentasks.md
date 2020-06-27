---
title: Open tasks (if you want to help)
---

Here you find some high level tasks (besides open issues and fixes) you
could work on

## as C++ programmer, *swift* pilot client


Requires: C++ skills, installation of Qt Creator

- Radar screen, pilot client. Create a UI for a radar screen (similar) to the one in FsInn. Populate this with data
- Integrate a small web server in the swift core, which will provide JSON web services as API to swift. Then the web service API will be used with the [swift Map]({{< ref "swiftmap" >}}):
    - we could integrate a small server, e.g. like [this one](http://stefanfrings.de/qtwebapp/tutorial/index.html)
    - We would make the API of the *swift* core available as web services, see doygen.
    - we would change *swift* map (written in JavaScript) to call those web service and display the traffic near real time
- swift pilot client download services. Allow to automatically update airline icons and such from the server
- CPDLC integration
- Read AIRAC data from locally installed data
- Show previews of the models in the mapping tool. No idea if and how this is possible, but would be nice to have such a feature.

## swift pilot client UI design tasks

Requires: less C++ skills than the above, but still installation of Qt
Creator, more focused on the UI builder, stylesheets

- Improve the layout of the text message parts. Currently this is layouted via a CSS, and mostly shown as table view. This could somehow look cooler
- Also the popup error and warning messages look a bit crude and could be refined (more 3D looking). So this could be fine tuned as well. This screenshot shows what we mean

![image](http://img.swift-project.org/PopUpErrorMessage.png)

- CPDLC: create the UI for the CPDLC integration

## as PHP/JavaScript programmer


- allow to request (change request) new liveries
- allow to upload airline icons
- notification services (push messages) when relevant data change (e.g. from datastore to slack)

## no programming skills required

- help with the efforts to create mappings, see [Mapping hints]({{< ref "maphints" >}})
- help us to complete the airline icons. Provide us with airline icons we can integrate, see [here]({{< ref "airlineicons" >}}) . Mind the copyright!
- ATC icons: We are using icons to represent the different ATC stations. Those icons currently have a low resolution. We could use them in higher resolutions and streamlined.

![image](http://img.swift-project.org/ATC_icons.png)

-   Read how to attach icons here: [Adding icons]({{< ref "newicons" >}})
