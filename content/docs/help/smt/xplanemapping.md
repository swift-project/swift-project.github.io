---
title: XPlane specific information
---

CSL vs. `.acf` aircraft
=======================

-   Like *XSquawkBox*, we render `CSL` models to represent the remote
    aircraft (other pilots).
-   There is a distinction between `CSL` and the aircraft that the local
    user flies (the `.acf` aircraft).
-   One cannot fly a `CSL`, and we cannot render a `.acf`.
-   We need both in the database, but we can not use `.acf` to render
    remote aircraft.
-   So [.acf]{.title-ref} aircraft are x **excluded**, which prevents
    them being used for rendering.
-   ACF aircraft with X normally do not belong in the model set (do not
    confuse model set and own models, we talk about the model set here)
-   But we use the `.acf` in the database so we know which plane the
    local user is flying, so we can pass that info to the other clients
    on the network.
-   See also `excludedmodels`{.interpreted-text role="ref"}
-   Do we need mappings for [ACF]{.title-ref} models? Yes, see
    `excludedmodels`{.interpreted-text role="ref"}

Model directories
=================

-   One can install CSL models wherever you want.
-   In the mapping tool, simulator settings panel, you direct swift
    where to search for them, by adding to the list of model
    directories.
-   All subdirectories of your X-Plane directory are already selected.
-   For your own (non-CSL) models, `[ACF]` and excluded should be
    automatically added by default when the mapping tool discovers the
    models.

Vertical offset fix
===================

-   Install the vertical offset fix for BlueBell models if needed, see
    `troubleshooting`{.interpreted-text role="ref"}
