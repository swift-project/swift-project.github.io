---
subtitle: Aircraft ICAO code hints
title: ICAO code hints
---

-   We have (or we target to have) all official ICAO codes
    [www.icao.int](http://www.icao.int/publications/DOC8643/Pages/Search.aspx)
    of in the database. The ICAO database is one of our main references.

    > -   Sometime it is hard to understand \"why\" or \"why not\" ICAO
    >     creates a new entry for a certain aircraft type.
    > -   Some entries of the ICAO database are duplicates of others
    >     entries. This seems to have technical reasons and we will try
    >     to eliminate those duplicates (if they are reported).
    > -   Rule of thumb: \"All entries of
    >     [www.icao.int](http://www.icao.int/publications/DOC8643/Pages/Search.aspx)
    >     minus duplicates\" are supposed to be in the *swift* DB

-   IATA codes: There are cases where IATA distinguishes two aircraft
    types, while ICAO does not. This means IATA uses are more detailed
    scheme and we (normally) create those extra entries.

-   Code descriptions:

    > -   We have 3 description fields which can be used to describe the
    >     aircraft. As those fields are searchable such descriptions
    >     will help to find the most appropriate entry.
    >
    > -   Normally we will use those fields to provide the company
    >     aircraft types.
    >
    > -   In cases where there are more detailed company codes (more
    >     detailed than the ICAO and IATA entries) we need to decide on
    >     a \"case by case\" basis if it makes sense to create multiple
    >     entries, or rather use one of the existing entries. This
    >     decision depends on many factors:
    >
    >     > -   Is there a visual difference among those company types?
    >     > -   Is that aircraft frequently used in flight simulation?
    >     > -   Are many distributions supporting this aircraft?

-   Remark: As it is easier to later merge entries (than to split them),
    sometimes it makes sense to create a new entry if not 100% sure.

::: {.note}
::: {.title}
Note
:::

The above explains why we use a review process to create new ICAO codes
:::
