---
title: 'Matching settings, using models without mapping entry / no DB
  entry'
---

Back to `settings`{.interpreted-text role="ref"} .

Matching settings
=================

In the matching settings you can configure how matching works/your
preferences. If you want to test your settings you can use the model
matcher, see mapping tool `testmodelset`{.interpreted-text role="ref"} .

![image](http://img.swift-project.org/Matching_settings1.png)

Reset matching script
=====================

Reset your settings (`reset all`) and **save your settings**.

![image](http://img.swift-project.org/matchingscript2.png)

![image](http://img.swift-project.org/matchingscript3.png)

Matching script
===============

Matching script allows to apply your own matching logic, see
`ms`{.interpreted-text role="ref"}

Using models without DB entry
=============================

Using models without DB entries (i.e. without mappings) is not the
recommend way. You can create mapping like described here:
`createmappings`{.interpreted-text role="ref"} .

However, if you want to use models without mappings:

-   allow those to be used in the model set, so enable it in the mapping
    tool. This allows those models to be added in the model set

![image](http://img.swift-project.org/swiftdblogin.png)

-   add the models you want to use in the model set
-   and in the pilot client enable those models to be considered in the
    matching

![image](http://img.swift-project.org/matchingsettings.png)
