---
title: Matching tips (or why model matching fails)
---

Fundamentals
============

-   `mm`{.interpreted-text role="ref"} , understand the fundamentals

-   Matching depends on the settings:
    `matchingsettings`{.interpreted-text role="ref"}

-   Without model set model matching is not possible. So check that you
    have created a model set:

    > -   Model set in `spc`{.interpreted-text role="ref"}
    >
    > ![image](http://img.swift-project.org/swift_pilot_client_aircraft_models.png)
    >
    > -   Model set in `smt`{.interpreted-text role="ref"}
    >
    > ![image](http://img.swift-project.org/swift_datastore_model_set.png)

Analyze your models and matching
================================

-   Use the matching messages to understand how a particular aircraft is
    matched. See `matchmsg`{.interpreted-text role="ref"}

    > ![image](http://img.swift-project.org/swift_pilot_client_matching_messages.png)

-   You can also see some mapping details in the models view. You can
    see how the ICAO code of the aircraft is mapped or how the livery is
    mapped `from -> to` or `[=]` (same code).

![image](http://img.swift-project.org/Models_view_see_mapping.png)

-   In the statistics view you can check if you have a model for a
    particular ICAO code combination installed

![image](http://img.swift-project.org/swift_pilot_client_statistics.png)

-   In the mapping tool you can check the coverage of your model set:

    > -   Create matrix
    >
    > ![image](http://img.swift-project.org/swift_mapping_tool_matrix.png)
    >
    > -   Example matrix
    >
    > ![image](http://img.swift-project.org/Model_set_example_matrix.png)
