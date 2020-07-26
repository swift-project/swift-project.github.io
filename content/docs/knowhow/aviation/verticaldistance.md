---
title: Aviation altitude (vertical distance)
---

{{% alert title="Note" color="primary" %}}
see also geodetic height
{{% /alert %}}

1.  <http://web.archive.org/web/20130626035126/http://www.gmat.unsw.edu.au/snap/gps/clynch_pdfs/coordcvt.pdf>
    page 5
2.  <http://www.esri.com/news/arcuser/0703/geoid1of3.html> "what is MSL"

| Name                | Description                                                                                                                                                                                                                                                                                                                                                                                                                |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| True Altitude       | This is the actual, physical distance between the aircraft and the mean sea level. It is what you would see if you could actually measure the distance with a very big ruler. In the real world, pilots usually do not use this, as it can usually only be measured approximately by GPS. In the virtual world (which is what swift is modelling), **it is what we generally use when talking to FSD and the simulators.** |
| Absolute Height AGL | This is the actual, physical distance between the aircraft and the ground directly beneath it. This could be as measured by a radar altimeter.                                                                                                                                                                                                                                                                             |
| Altitude QNH        | This is the altitude above mean sea level as measured by a pressure altimeter on the aircraft. In order to relate this to any other type of altitude, two data must be known: the actual atmospheric QNH (e.g. obtained by METAR), and the QNH setting which the pilot has dialled into their altimeter; these two data might be different, so both must be known.                                                         |
| Flight Level        | Besides the fact that the unit of measurement is always hundreds of feet, the only difference between Flight Level and Altitude QNH is that the QNH setting is always fixed at 1013.2hPa or 29.92inHg. Therefore one datum must be known: the actual atmospheric QNH (e.g. from METAR).                                                                                                                                    |
| Height QFE          | This is the height above a reference elevation at e.g. an airport. Height QFE differs from Altitude QNH only in that the reference point is an elevation above or below mean sea level, rather than mean sea level itself (MSL+0). Therefore three data must be known: the actual atmospheric QNH, the pilot's QNH setting, and the QFE reference elevation.                                                               |

In addition, an altitude can be either an indicated altitude of an
actual aircraft or other object in real time, or a nominal altitude such
as entered in a flight plan. These two groups, multiplied by the five
above, gives a total of ten.

This matrix shows the data which would be needed to convert between
different types of altitude:

|                         | True Altitude                          | Absolute Height AGL                                      | Altitude QNH                                 | Flight Level                              | Height QFE                                               |
|-------------------------|----------------------------------------|----------------------------------------------------------|----------------------------------------------|-------------------------------------------|----------------------------------------------------------|
| **True Altitude**       |                                        | Ground elevation                                         | Actual QNH and set QNH                       | Actual QNH                                | Actual QNH, set QNH, and QFE elevation                   |
| **Absolute Height AGL** | Ground elevation                       | Ground elevation x2                                      | Ground elevation, actual QNH, and set QNH    | Ground elevation and actual QNH           | Ground elevation, actual QNH, set QNH, and QFE elevation |
| **Altitude QNH**        | Actual QNH and set QNH                 | Ground elevation, actual QNH, and set QNH                | Actual QNH x2 and set QNH x2                 | Actual QNH x2 and set QNH                 | Actual QNH x2, set QNH x2, and QFE elevation             |
| **Flight Level**        | Actual QNH                             | Ground elevation and actual QNH                          | Actual QNH x2 and set QNH                    | Actual QNH x2                             | Actual QNH x2, set QNH, and QFE elevation                |
| **Height QFE**          | Actual QNH, set QNH, and QFE elevation | Ground elevation, actual QNH, set QNH, and QFE elevation | Actual QNH x2, set QNH x2, and QFE elevation | Actual QNH x2, set QNH, and QFE elevation | Actual QNH x2, set QNH x2, and QFE elevation x2          |
