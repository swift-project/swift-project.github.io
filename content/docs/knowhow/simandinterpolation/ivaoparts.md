---
title: IVAO parts
---

see
<https://discordapp.com/channels/539048679160676382/695961646992195644/707915838845485187>

Es dürfte jetzt nur ein Protokolltyp übrig sein, der von X-IVAP kommt
und mit dem SWIFT nix anfangen kann. Dieser stamm aus der
Protokollrevision \"B\" (IVAO)

Beispiel: `MDMDN0104:262396:262396:262396`, dieser beinhaltet binär
codiert 3 mal die gleichen (hier 262396) in der nachfolgenden Struktur
angegeben Parameter.

``` {.}
unsigned long pp;
   pp =(unsigned int)strtoul(array[2],(char **)NULL,10); // array[2] steht für den zweiten Parameter

   thisclient->params.gear                 =(pp&(unsigned)1); 
   thisclient->params.landLight              =(pp&(unsigned)2)>>1;
   thisclient->params.navLight            =(pp&(unsigned)4)>>2;
   thisclient->params.strobeLight            =(pp&(unsigned)8)>>3;
   thisclient->params.beaconLight          =(pp&(unsigned)16)>>4;
   thisclient->params.taxiLight        =(pp&(unsigned)32)>>5;
   thisclient->params.engine1Running    =(pp&(unsigned)64)>>6;
   thisclient->params.engine2Running    =(pp&(unsigned)128)>>7;
   thisclient->params.engine3Running    =(pp&(unsigned)256)>>8;
   thisclient->params.engine4Running    =(pp&(unsigned)512)>>9;
```

Da der per broadcast verteilt wird, trifft er auch Clients mit SWIFT.
Aus diesen Informationen erzeuge ich aber auch die json-Struktur für
SWIFT und sende diese ebenfalls an alle. Ihr könntet also \"-MD\"
ignorieren oder wie oben beschrieben auswerten. Negative Auswirkungen
auf SWIFT haben die \"-MD\"-Protokolle nicht.
