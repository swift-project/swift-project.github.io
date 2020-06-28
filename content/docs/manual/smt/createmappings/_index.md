---
title: Create mappings for swift
---

-   Tutorials: `smttutorials`{.interpreted-text role="ref"}
-   `effmappings`{.interpreted-text role="ref"}
-   `cr`{.interpreted-text role="ref"}
-   `maphints`{.interpreted-text role="ref"}
-   `problemsmapping`{.interpreted-text role="ref"}

::: {.important}
::: {.title}
Important
:::

We recommend to save your stash after you have create the mappings. If
something goes wrong you can reload your work and publish it again.
:::

**Login**

In order to create mappings you need to login within the swift
datastore: In the mapping tool, go to the \"Settings and Login\" tab,
and login with the DB. After the login you can see your roles as
explained in `mappingroles`{.interpreted-text role="ref"}

![image](http://img.swift-project.org/Mapping_tool_login.png)

**Models with/without mapping**

Models which already have a database mapping are indicated by a database
icon. You can see that in the screenshot. Normally you need to create
mappings only if it not yet exists.

It can also happen, that your data are outdated and in the meantime
someone has created a mapping for model, which is not yet shown with the
database icon. You can read more about
`data consolidation here <smt>`{.interpreted-text role="ref"}.

Another good reason to change an existing mapping is if it is wrong. In
this case you can correct the mapping. The procedure (for you) is the
same, regardless if you create a new mapping or modify an existing one.

![image](http://img.swift-project.org/WithAndWithoutMapping.png)

**Direct mappings / Change requests**

Users with \"bulk\" update right and higher (see
\[\[help/datastore/mappingroles/\]\]) can directly write to the DB.
Other users will be able to create change requests. For you as a user
there is almost no difference in creating the mapping, only the release
process is different.

-   Normal users: publish {icon caret-right color=blue} change request
    {icon caret-right color=blue} confirmed {icon caret-right
    color=blue} in DB

![image](http://img.swift-project.org/Publish_CR_buttons.png)

-   Direct updates:

![image](http://img.swift-project.org/Publish_direct_buttons.png)

-   new mappings: publish {icon caret-right color=blue} in DB
-   changed mappings: publish {icon caret-right color=blue} change
    request {icon caret-right color=blue} confirmed {icon caret-right
    color=blue} in DB

**Mapping confirmation**

After you have successfully published your mappings you will see a
\"confirmation screen\". You can remove those published models (if you
like) from the stash. Doing so allows you to publish step by step.

![image](http://img.swift-project.org/Publish_confirmation.png)

**Equal mappings**

It does not make sense to publish mappings identical to an existing one
in the DB. This would only create unnecessary change requests and work
history entries. Therefor publishing identical entries is rejected. You
will see a message like this in such a case:

![image](http://img.swift-project.org/Backend_no_changes.png)

**Problems?**

see `problemsmapping`{.interpreted-text role="ref"}

::: {.toctree glob="" caption="Content in this chapter"}
./\*
:::
