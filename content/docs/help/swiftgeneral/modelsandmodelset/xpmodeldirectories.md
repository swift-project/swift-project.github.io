---
title: 'Where should I place my XPlane model directories?'
---

::: {.todo}
Add missing images.
:::

::: {.important}
::: {.title}
Important
:::

Your models for XPlane (and *swift*) should be below (inside) the XPlane
folder. Otherwise XPlane is unable to show these models.
:::

As example an installation could look like this with [XCSL]{.title-ref}
and [BB]{.title-ref} models

| {F37522} \| {F37524} \| {F37530} \|

By default swift will search all models inside the XPlane folder, the
XPlane folder is normally found automatically (left screenshot). You
could also explicitly set the directories (by that you would eliminate
the risk that some models are found which you actually do **NOT** want
to use)

| {F37532} \| {F37534} \|

You could also create an explicit folder for your swift models and copy
them into that folder. By that you make sure that changes by other
installers/clients does NOT affect your models

| {F37536} \| {F37540} \|

Make sure:

-   that all folders are inside the XPlane folder
-   you do not add models twice (if you have the [BB]{.title-ref} models
    in two different folders, only select one)
-   if you move or change your installed models you need to update your
    model set. AGAIN: Just changing the setting does NOT change the
    model set, you need to update it for the new path.

Example
=======

| {F37542} \| {F37544} \| If I select [BB]{.title-ref} only I see around
  1800 models \|
| {F37550} \| {F37554} \| [XCSL]{.title-ref} only around 4387 models \|
| {F37552} \| {F37546} \| Both together more than 6200 models \|

-   Do NOT confuse the model set and the model list discussed in this
    step, see `modelsetandsettings`{.interpreted-text role="ref"} .
-   Hint:: If you use models of multiple providers in your set, we
    recommend to remove duplicates, see
    `modelsetduplicates`{.interpreted-text role="ref"} and
    `examplemsbbxcsl`{.interpreted-text role="ref"} .
