---
title: swift pilot client text message handling (disable overlay
  messages)
---

Detached message window
=======================

You can detach the `message window` (like any other window)

![image](http://img.swift-project.org/Detached_message_window.png)

Overlay messages
================

From the ATC and cockpit view you can use overlay text messages directly
in the window

![image](http://img.swift-project.org/ATC_overlay_window.png)

![image](http://img.swift-project.org/Overlay_text_messages.png)

Private message buttons
=======================

You can use the `private message buttons` to send private messages to
the closest ATC stations

![image](http://img.swift-project.org/Private_message_buttons.png)

Configure text messages
=======================

-   Defining which text messages are relayed to the simulator

![image](http://img.swift-project.org/Text_messages_to_simulator.png)

-   Defining which text messages are shown as overlay in the client

![image](http://img.swift-project.org/messagesoverlaysettings.png)

-   Set focus as wanted

Disable overlay messages
========================

Disable all checkboxes for overlay messages

![image](http://img.swift-project.org/disableoverlay.png)

Text message views
==================

Normally you have text views for each radio channel and/or private text
messages. The UNICOM and COM1/2 channels are permanent while the private
channels can be closed.

![image](http://img.swift-project.org/textmessages.png)

That leads us to the role of the `ALL` view. This is a sortable table
view (and no HTML text view as the other ones). It\'s role is different:
It can help you to find a message again if you have already closed the
private message tab or you do not know where it was.

If you do not know how to resize the columns we recommend the \"UI tips
and tricks\" `pctutorials`{.interpreted-text role="ref"}

Hint: You can use the tooltip to see longer messages .. image::
<http://img.swift-project.org/longmessage.png>

Relay messages to simulator
===========================

`simmessages`{.interpreted-text role="ref"}
