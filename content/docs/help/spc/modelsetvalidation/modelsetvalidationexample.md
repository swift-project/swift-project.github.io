---
title: Model set validation example
---

see also `modelsetvalidation`{.interpreted-text role="ref"} and
`disabledmodels`{.interpreted-text role="ref"} .

Validation
==========

In the client a validation error is shown, here one model is shown as
invalid.

![image](http://img.swift-project.org/invalidmodel.png)

It is also a good idea to check the messages/warnings

![image](http://img.swift-project.org/modelvalidation.png)

Resolve issues
==============

Let\'s check the messages first, we deal with the invalid model later.
But there is also a warning about missing DB data. This means you have
used models in your set without DB metadata. This is possible but not
recommended.

As you can see there are entries without DB data, as you can see by the
missing DB icon.

![image](http://img.swift-project.org/missingdbentry.png)

There are three options now:

-   someone creates mapping for those
-   you remove them from the model set
-   you ignore the warnings, which can lead to undesired matching
    results

Now we deal with the model

As a first step I do disable the invalid model (validation dialog)

![image](http://img.swift-project.org/invalidmodels.png)

Then I can highlight the invalid model in the mapping tool

![image](http://img.swift-project.org/Highlite_invalid.png)

Or you can exclude those models from the model set via the context menu

![image](http://img.swift-project.org/exludemodesl.png)
