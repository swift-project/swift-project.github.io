---
subtitle: Input Device and Hotkey Management
title: Hotkeys (architecture)
---

General
=======

Across the chapters, the following definitions shall apply:

**Hotkey Source (Device)**: Implementation or device object, which can
trigger a hotkey function, e.g. keyboard, joystick, remote event

**Hotkey Action**: String based object with hierarchical syntax,
describing and grouping hotkey purpose, e.g. push-to-talk

**Hotkey Receiver Object:** Any kind of object which registers one if
its methods for a Hotkey Function

Object Interface Overview
=========================

Different objects and interfaces are involved and will be explained in
details below

Interface `CInputManager` vs. `Hotkey Receiver Objects`
-------------------------------------------------------

First of all a hotkey receiver object is an object which exposes one or
more of its methods as hotkey method. Typical examples are
`CContextAudio` for push to talk and GUI for different GUI hotkeys.

Sources and receivers of a hotkey action are not coupled. A receiver
does not know which source triggered the hotkey action. The same is
applicable the other way round. A source does not know, which hotkey
function it might trigger - if any. The mapping logic is done in
`CInputManager`. It is the central node wiring source and receiver
together.

![image](http://img.swift-project.org/input_manager.png)

Hotkey receiver objects bind a method to a hotkey action. The hotkey
action is a string with a hierarchical syntax, e.g. `/Test/Message`.
`Test` stands for an arbitrary group into which `Message` belongs. This
syntax can be used to logically group hotkeys together. No
`Hotkey Source` is involved at this stage (no keyboard keys, no joystick
etc). To the object itself it is transparent which `Hotkey Source` the
call had issued.

Usage example:
`BlackCore::CActionBind m_action { "/Test/Message", this, &CFoo::bar };`

Interface `CInputManager` vs. `Hotkey Source (Device)`
------------------------------------------------------

![image](http://img.swift-project.org/input_keyboard_joystick.png)

`CInputManager` will feed all configured keys/buttons to the
corresponding device interface. Registered `CKeyboardKeys` will be
registered in `IKeyboard`, joystick buttons will be registered in
`IJoystick`. `IKeyboard` and `IJoystick` will signal back if one of the
registered keys/buttons have been pressed. No actions are involved at
this stage. `CInputManager` knows, which `Hotkey Receiver Objects` are
registered and will call their functions.

Advantages:

> -   Only keys need to be registered which have to be monitored locally
> -   Can be extended easily by adding a new input device.

Hotkey Action forwarding to Remote
----------------------------------

Hotkey actions do not have to be limited to local execution. If
forwarding is enabled, all triggered actions will be forwarded to a
remote process running on any machine. This allows for example to
configure a push to talk hotkey on one machine, even though core is
running in a different process.

![image](http://img.swift-project.org/Input_Manager_Events.png)

Advantages:

> -   Only one event type is required, even if more input devices are
>     added
> -   Remote `CInputManager` does not need to know the configuration of
>     the local GUI, it will just react on the given inputs from DBus.

Interface `CInputManager` vs. `Settings`
----------------------------------------

`CInputManager` is interfacing with the settings API. The list of action
hotkeys - which is the mapping between a hotkey combination and the
hotkey action is loaded during start up and modifications saved to disk.

Summary
=======

The design is conceptual only. It addresses the new requirements of
different instead of only one input device. Input has to be transparent
(keyboard, joystick, event, anything else) and decoupling of different
objects is IMHO good OO design. It hopefully reduces complexity within
swift a lot.
