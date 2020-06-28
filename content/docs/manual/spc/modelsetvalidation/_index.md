---
title: Model set validation
---

**General**

*swift* assumes that the **models in your set are properly installed and
working for your simulator**. If not, it can happen that *swift* uses a
model (as result of the matching procedure) which then fails to render.

::: {.important}
::: {.title}
Important
:::

The normal situation should be that there are no validation errors. Fix
your model set if models are removed or changed. So it is your
responsibility to keep your model set up to date. However there are some
tools helping you.
:::

It can happen that models fail even though there is no validation error,
see `disabledmodels`{.interpreted-text role="ref"}

**Reasons for validation errors**

-   have you moved your model directories?
-   have you deleted models?
-   have you run updates that might have changed the models?

All that requires updating the own models and the model set. Check the
model file path of the models in your model set, then you can see where
*swift* expects the models. If you want to fix the path, you can
re-create the model set, see `createms`{.interpreted-text role="ref"} .

**How to enable validation?**

From the settings (use SHIFT + settings button to get to the first
page), click matching, scroll down a bit

![image](http://img.swift-project.org/failurehandling.png)

**Pilot client validations**

In the matching settings you can setup how *swift* handles validation.

![image](http://img.swift-project.org/Matching_settings.png)

1.  Verify set at startup: Checks your model set after *swift* was
    started.
    1.  this requires *swift* can access the model files (disk access to
        the model files)
    2.  this takes a while before completed (and runs in background)
    3.  models failing will be temporarily disabled
    4.  *swift* gives up if there are too many files failing, because it
        then assumes there is a general issue
2.  temporarily remove models failing. This means if a model fails
    during the matching process it will not be used anymore this session
    and the model will be disabled
3.  in order to avoid seeing a disabled model you can select the \"use
    other model option\". *swift* then tries to use another model before
    it fails, but gives up after some time

This is how the result dialog looks like. There you can temp. disable
such models.

![image](http://img.swift-project.org/Validation_dialog.png)

After you have disabled models you wold see them \"in red\" in the model
view (might be you have to press \"load set\" to refresh the view).

![image](http://img.swift-project.org/Temp_disabled_models.png)

Btw, you can also temp. disable a model from the context menu.

![image](http://img.swift-project.org/Context_menu_temp_disable.png)

**Trigger validation in pilot client**

From the model page in the client, click the [validate]{.title-ref}
button,

![image](http://img.swift-project.org/triggervalidation.png)

In the validation popup you either see messages already (if there are
results already), or press [trigger validation]{.title-ref} to start the
validation (which takes a while before there are results)

![image](http://img.swift-project.org/triggervalidation1.png)

**Validation in mapping tool**

::: {.important}
::: {.title}
Important
:::

This does a live check (unlike the background check of the pilot client
above). In case the files are not accessible on a remote drive it can
cause the mapping tool to hang before a timeout is reported.
:::

In the mapping tool just select the models to be checked and run the
validation.

![image](http://img.swift-project.org/Context_menu_model_validation_mapping_tool.png)

![image](http://img.swift-project.org/Mapping_tool_validation.png)

If there was a previous validation in the *swift* pilot client yielding
some invalid models, those can be also highlighted in the mapping tool.

![image](http://img.swift-project.org/Highlite_invalid.png)

**A real world example**

see `modelsetvalidationexample`{.interpreted-text role="ref"}

::: {.toctree caption="Content in this chapter"}
modelsetvalidationexample disabledmodels whyvalidationerrors
:::
