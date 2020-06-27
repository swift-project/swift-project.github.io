---
title: Aviation altitude (vertical distance)
---

::: {.note}
::: {.title}
Note
:::

see also geodetic height
:::

1.  <http://web.archive.org/web/20130626035126/http://www.gmat.unsw.edu.au/snap/gps/clynch_pdfs/coordcvt.pdf>
    page 5
2.  <http://www.esri.com/news/arcuser/0703/geoid1of3.html> "what is MSL"

  ------------------------------------------------------------------------------
  True       This is the actual, physical distance between the aircraft and the
  Altitude   mean sea level. It is what you would see if you could actually
             measure the distance with a very big ruler. In the real world,
             pilots usually do not use this, as it can usually only be measured
             approximately by GPS. In the virtual world (which is what swift is
             modelling), **it is what we generally use when talking to FSD and
             the simulators.**
  ---------- -------------------------------------------------------------------
  Absolute   This is the actual, physical distance between the aircraft and the
  Height AGL ground directly beneath it. This could be as measured by a radar
             altimeter.

  Altitude   This is the altitude above mean sea level as measured by a pressure
  QNH        altimeter on the aircraft. In order to relate this to any other
             type of altitude, two data must be known: the actual atmospheric
             QNH (e.g. obtained by METAR), and the QNH setting which the pilot
             has dialled into their altimeter; these two data might be
             different, so both must be known.

  Flight     Besides the fact that the unit of measurement is always hundreds of
  Level      feet, the only difference between Flight Level and Altitude QNH is
             that the QNH setting is always fixed at 1013.2hPa or 29.92inHg.
             Therefore one datum must be known: the actual atmospheric QNH (e.g.
             from METAR).

  Height QFE This is the height above a reference elevation at e.g. an airport.
             Height QFE differs from Altitude QNH only in that the reference
             point is an elevation above or below mean sea level, rather than
             mean sea level itself (MSL+0). Therefore three data must be known:
             the actual atmospheric QNH, the pilot's QNH setting, and the QFE
             reference elevation.
  ------------------------------------------------------------------------------

In addition, an altitude can be either an indicated altitude of an
actual aircraft or other object in real time, or a nominal altitude such
as entered in a flight plan. These two groups, multiplied by the five
above, gives a total of ten.

This matrix shows the data which would be needed to convert between
different types of altitude:

  ----------------------------------------------------------------------------------
               **True       **Absolute     **Altitude     **Flight    **Height QFE**
               Altitude**   Height AGL**   QNH**          Level**     
  ------------ ------------ -------------- -------------- ----------- --------------
  **True                    Ground         Actual QNH and Actual QNH  Actual QNH,
  Altitude**                elevation      set QNH                    set QNH, and
                                                                      QFE elevation

  **Absolute   Ground       Ground         Ground         Ground      Ground
  Height AGL** elevation    elevation x2   elevation,     elevation   elevation,
                                           actual QNH,    and actual  actual QNH,
                                           and set QNH    QNH         set QNH, and
                                                                      QFE elevation

  **Altitude   Actual QNH   Ground         Actual QNH x2  Actual QNH  Actual QNH x2,
  QNH**        and set QNH  elevation,     and set QNH x2 x2 and set  set QNH x2,
                            actual QNH,                   QNH         and QFE
                            and set QNH                               elevation

  **Flight     Actual QNH   Ground         Actual QNH x2  Actual QNH  Actual QNH x2,
  Level**                   elevation and  and set QNH    x2          set QNH, and
                            actual QNH                                QFE elevation

  **Height     Actual QNH,  Ground         Ground         Actual QNH  Actual QNH x2,
  QFE**        set QNH, and elevation,     elevation,     x2, set     set QNH, and
               QFE          actual QNH,    actual QNH,    QNH, and    QFE elevation
               elevation    set QNH, and   set QNH, and   QFE         
                            QFE elevation  QFE elevation  elevation   
  ----------------------------------------------------------------------------------
