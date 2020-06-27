---
title: 'Data provisioning (where do the mappings come from?)'
---

The *swift* model data are stored in the [datastore
database](https://datastore.swift-project.org/page/index.php). This
database contains all mappings, ICAO codes etc. used with swift.

There are **two ways** to obtain these data. *swift* will always
download the data and store them locally in cache files.

-   the mapping tool will download the data via web services directly
    from the database
-   the client (pilot client) will download the data as files, we call
    them *shared data file* . The files are generated from the database
    and distributed to different servers. The content of the //shared
    files// is basically the same as in the web services, but it is a
    snapshot of the time when they are generated.

Some explanations:

-   for mapping (direct access to swift database)

    > -   the mapping tool writes directly to the database as all users
    >     editing the data always need the latest data. Also they have
    >     to work on the same data.
    > -   if the database is down, users can still use the cached data,
    >     but not write data. This is not really a problem as the users
    >     can save the stash and continue at a later time
    > -   there are only a few users concurrently creating mappings.
    >     Creating mappings is a specialized task only for power users.
    > -   Since only few members work directly with the database it is
    >     not a performance problem.

-   for the pilot client (shared files)

    > -   there are much more users using the pilot client
    >
    > -   during a flight the model data must not be updated, as this
    >     would consume too much time and affect interpolation
    >
    > -   there are too many users so that not everybody can download
    >     directly from the database.
    >
    > -   the pilot client downloads the shared files. as these files
    >     are available on multiple servers:
    >
    >     > -   the download is redundant, if one server is down the
    >     >     shared files can be downloaded from another server
    >     > -   the traffic is distributed, the swift team can open new
    >     >     download servers and hence share the network traffic
