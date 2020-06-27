---
title: 'Should I use models without DB data in my model set?'
---

-   In general all models in the model set should have a DB entry, only
    those have correct data assigned

![image](http://img.swift-project.org/database.png)

-   The default matching settings even ignore the models without DB
    entries

![image](http://img.swift-project.org/nodbentry.png)

However, there can be reasons where it make sense to include non DB
models. If you write your own matching script, then you might want to
use raw models (see `ms`{.interpreted-text role="ref"} ) .

To use models without DB data, see `matchingsettings`{.interpreted-text
role="ref"} .
