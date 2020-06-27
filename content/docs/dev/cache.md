---
title: Caches
---

A value cache is a map of `QString` keys to `CVariant` values, stored
within an entity class which provides distributed access to modify
values and to be notified by a signal when a value is modified. Access
is provided to `QObject`-derived classes through a member of type
`CCached<T>`, where `T` is the expected value type of the specific value
of interest. `CCached<T>` automatically converts the `CVariant` to and
from the target type `T`. The `CValueCache` itself, being just a map of
key strings and values, has no contextual awareness of the semantic
meaning of any of the values it contains. That awareness is located at
the level of the `CCached<T>`. Through the constructor of `CCached<T>`,
an owning class can provide validation routines, default values, and a
slot to be called when the value changes. Validation occurs when an
object changes a value via a member `CCached<T>`, and a second,
redundant validation occurs when any other object accesses the changed
value via its own `CCached<T>`.

Theory of operation
===================

Distributed values
------------------

There are two layers of distribution in the value cache system. Both
layers of distribution are structurally very similar. In the first
layer, values can be distributed among objects in the same process but
potentially in different threads. This mode of distribution relies on
the regular Qt signal/slot system. In the second layer, values can be
distributed among objects in different processes. This mode of
distribution relies on the Qt signal/slot system and an
interprocess-communication (IPC) mechanism, such as DBus. The particular
IPC mechanism used is decoupled from the value cache system.

Same-process distribution
-------------------------

Internally, the `CCached<T>` will create a `CCachePage` as a child
object of its owner. If an object owns multiple `CCached<T>` objects,
then they will all share the same `CCachePage`, which acts as the
unified point of access for that owning object. The multitude of
`CCachePage` instances in the process communicate with the `CValueCache`
through signals and slots. The signal `CValueCache::valuesChanged` is
connected to the slot `CCachePage::changeValuesFromCache`, and the
signal `CCachePage::valuesWantToCache` is connected to the slot
`CValueCache::changeValues`. The connection mode is
`Qt::AutoConnection`, so the signals will be queued in the event loops
of the appropriate threads. Signals are always queued in the same order
in every thread, so all the `CCachePage` instances will observe value
changes occurring in the same order, and this will guarantee that they
maintain consistency with each other.

![image](http://img.swift-project.org/cacheseq.png)

Inter-process distribution
--------------------------

The structure of connections between `CValueCache` instances distributed
in different processes is essentially the same as the structure of
connections between `CValuePage` instances in different threads within
the same process, but at a larger scale. One process acts as central
router, and again, the fact that signals are always received in the same
order they were emitted ensures that all processes see a consistent
state. This reusable design pattern is explored in more detail at
`relayevent`{.interpreted-text role="ref"} :.

![image](http://img.swift-project.org/cache.png)

Specific caches
===============

Settings
--------

Settings are implemented on top of the value cache system. The `CSettingsCache` singleton inherits from `CValueCache`. The `CSetting<Trait>` template extends `CCached<T>` with support for validators and default values encapsulated in a trait class alongside the key string. 

Each trait represents a specific value in the settings. As a minimum, the trait class must have a member typedef `type` which is the value type of the cached value, and a static method `key()` which returns the key string of the cached value. The `CSettingTrait` base class simplifies the task of writing new traits.

Batched changes
===============

If a class changes multiple settings at the same time, it is desirable
that only one signal be emitted which covers all the changes, instead of
emitting a separate signal for each individual setting. This is achieved
using \"batched\" changes:

```cpp
{
    auto batch = CSettingsCache::instance()->batchChanges(this); // RAII object
    m_fooSetting.set(1234);
    m_barSetting.set(5678);
}
// RAII object destroyed here, its destructor causes the changes to m_fooSetting and m_barSetting to be committed.
```

Reacting to validation failures
-------------------------------

In the above example, if `5678` was invalid for `m_barSetting`, the
change to `m_fooSetting` would nevertheless be committed anyway. In
order for the validation failure to discard the whole batch, we use
exceptions:

```cpp
try
{
    auto batch = CSettingsCache::instance()->batchChanges(this); // RAII object
    m_fooSetting.set(1234).maybeThrow(); // set() returns CStatusMessage...
    m_barSetting.set(5678).maybeThrow(); // ...maybeThrow() throws an exception if the message is not empty.
}
catch (const CStatusException &ex)
{
    // RAII object destroyed here and batch is abandoned.
    // Display dialog box with ex.status().message()
}
// RAII object destroyed here and batch is committed if exception was not thrown.
```
