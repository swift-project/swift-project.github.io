---
title: 'Simulator weather, where does the swift weather come from?'
---

Simulator Weather
=================

Scope
-----

This page collects different information regarding weather creation and
injection into an arbitrary simulator. The first version is a collection
of information which was gathered over the last couple of weeks/months.
It contains weather and METAR sources, API information and techniques
required to implement a sophisticated weather engine. For the time being
this page is a central place to store and share knowledge.

Roadmap
-------

Currently a very basic and simple version of a weather engine is
implemented in *swift*. We do not plan to implement a sophisticated
weather engine, but a simple one for those who have no other engine.

You can enable/disable *swift* weather from `settings`{.interpreted-text
role="ref"} .

Weather Sources
---------------

The following real weather sources exist and can be used to retrieve
real time data. They are listed in the order of priority how they should
be used.

### Global Forecast System (GFS) Model

The Global Forecast System (GFS) is a global numerical weather
prediction system containing a global computer model and variational
analysis run by the US National Weather Service (NWS).

The mathematical model is run four times a day, and produces forecasts
for up to 16 days in advance, but with decreased spatial resolution
after 10 days. The forecast skill generally decreases with time (as with
any numerical weather prediction model) and for longer term forecasts,
only the larger scales retain significant accuracy. It is one of the
predominant synoptic scale medium-range models in general use.

GFS products are available for any position on earth and can be
retrieved via <http://www.nco.ncep.noaa.gov/pmb/products/gfs/>. This
turns it into a perfect weather source candidate for areas with no ICOA
stations available (areas above the oceans, etc.)

### VATSIM METAR

It is generally possible to query the METAR string for a given ICAO
airport. METAR is only valid for a small area around the airport and has
a lot less information compared to the layers described above.

\#\#\# VATSIM Weather

VATSIM server provide the ability to request detailed weather
information for ICAO stations around the globe. On request it will
provide the following information.

**Wind Data** (4 layers):

  ---------- -------- ------------ -------- ---------- -------------
  .Ceiling   .Floor   .Direction   .Speed   .Gusting   .Turbulence

  ---------- -------- ------------ -------- ---------- -------------

**Cloud Data** (2 layers):

  ---------- -------- ----------- -------- -------------
  .Ceiling   .Floor   .Coverage   .Icing   .Turbulence

  ---------- -------- ----------- -------- -------------

**Cloud Data** (4 layers):

  ---------- --------------
  .Ceiling   .Temperature

  ---------- --------------

!!This data is produced from a simple extrapolation from the airport
METAR. It is therefore very inaccurate and usage is not recommended.!!

Simulator Interfaces
====================

Microsoft Flight Simulator Family
---------------------------------

The Microsoft Flight Simulator family offers several ways to inject used
defined weather into the simulator.

**FSUIPC - New Weather Interface** (FSX and FS2004): The NWI allows to
write weather details **per station** into the simulator. Usually you
should set GLOB weather first and then every ICAO station in the range
of 40 nm.

<http://www.schiratti.com/dowson.html>

**SimConnect** (FSX): SimConnect allows to set weather **per station**
via an extended METAR string.
[https://msdn.microsoft.com/en-us/library/cc526983.aspx\\\#SimConnect\\\_WeatherSetObservation](https://msdn.microsoft.com/en-us/library/cc526983.aspx\#SimConnect\_WeatherSetObservation)

**Weather Theme Files** (FSX and FS2004): Weather theme files (WTB) are
binary files which contain a very detailed description of the weather
around the user aircraft. It is independent from any ICAO station. In
the first place weather theme files were used to save used defined
weather, created inside the simulators itself. The user was able to
setup a scenario on his own and load it. Actually all saved conditions
(CAVOK, storm, etc.) which you can choose when starting MSFS are stored
as WTB files. The FS2004 Weather Themes Software Development Kit is a
Visual Basic application which allows the user to also setup weather
scenarios outside of MSFS. Luckily both simulators - FSX and FS2004 -
support these WTB files and even better they can be loaded at runtime
via FSUIPC (TBC) and SimConnect
([SimConnect\_WeatherSetModeTheme]{.title-ref}). This files can be
created and loaded by any external application and then loaded into FS.
The file format is proprietary but is successfuly reversed engineered
and a library to read and write these files is available
([libwtb]{.title-ref} - written by me, so we have full control).

**X-Plane DataRefs** (X-Plane): The weather in X-Plane can be configured
via the datarefs in sim/weather/. Unfortunately it does have only 1D
vertical layers, which means you can configure only global weather with
different altitude layers.

1.  Reference Implementation

> -   [XplaneNoaaWeather](https://github.com/joanpc/XplaneNoaaWeather) A
>     python based X-Plane weather plugin licensed under GPLv2.
