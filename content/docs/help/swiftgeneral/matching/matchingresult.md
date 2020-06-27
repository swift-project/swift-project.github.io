---
title: 'Why do I see airline FOO for airline BAR aircraft?'
---

Matching means to find the most suitable model for another pilot in your
model set. If the other pilot flies a [DLH B744]{.title-ref} and you
have [DLH B744]{.title-ref} in your model set, then the process is
straight forward, we just take that one.

**If NOT**, then guessing starts and the opinion of what should happen
varies.

-   some want to see a neutral (all white) aircraft
-   some want to see a [B744]{.title-ref}, but accept that from another
    airline
-   some prefer to see a [DLH]{.title-ref} livery but accept another
    aircraft type

So there is not \"best\" solution, it depends on multiple factors. The
result in swift depends on

\# the models you have in your *swift* model set, `mm`{.interpreted-text
role="ref"} \# your model matching settings, see
`matchingsettings`{.interpreted-text role="ref"} \# your own matching
script (if you have written any), see `ms`{.interpreted-text role="ref"}

This means the result for *swift* users can be (very) different
depending on the mentioned points. If you want to understand your
matching result, just create a matching log -
\[`matchmsg`{.interpreted-text role="ref"} .

To improve your matching check `matchinghints`{.interpreted-text
role="ref"} . But there are things you can check by yourself.

-   Do you use models without swift DB entry? Those might be unreliable
    because not enough information are available.
-   Check your settings, see `matchingsettings`{.interpreted-text
    role="ref"}
-   Check the matching log, in many cases this is already
    self-explanatory
-   If you want to see airline [FOO]{.title-ref}, do you have models for
    [FOO]{.title-ref}? Check your coverage:
    `tuningset`{.interpreted-text role="ref"}
-   You could use your own logic, see `ms`{.interpreted-text role="ref"}
