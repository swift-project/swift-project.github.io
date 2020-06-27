---
see also: |
  -   \[\[knowhow/aviation/verticaldistance/\| aviation altitude\]\]
  -   \[\[knowhow/altitude/\]\]
  -   \[\[knowhow/simandinterpolation/simelevation/\]\]
title: 'On ground? Using different sceneries overview'
---

\<table\> \<tr\> \<th\>Scenario\</th\> \<th\>with altitude sent
only\</th\> \<th\>with ground flag\</th\> \<th\>with elevation from own
sim\</th\> \</tr\> \<tr\> \<th\>same elevation {F4093, width=50%}\</th\>
\</tr\> \<tr\> \<th\>own sim\'s elevation lower {F4092,
width=50%}\</th\> \<td\>looks like aircraft is hovering while
taxiing\</td\> \<td\>fixes hovering, but as soon [ground -\>
false]{.title-ref} the aircraft is lifting\</td\> \<td\>allows to place
on elevation + CG (offset)\</td\> \</tr\> \<tr\> \<th\>own sim\'s
elevation higher {F4089, width=50%}\</th\> \<td\>looks like aircraft is
below surface, bumpy taxiing\</td\> \<td\>underflow fixed, but when
[ground -\> false]{.title-ref} it can happen the aircraft sinks into
ground before taking off\</td\> \<td\>underflow fixed, as used altitude
will never below scenery elevation\</td\> \</tr\> \<tr\> \<th\>same
elevation {F4091, width=50%}\</th\> \</tr\> \<tr\> \<th\>own sim\'s
elevation lower {F4094, width=50%}\</th\> \<td\>aircraft never touching
ground, hovering\</td\> \<td\>fixes hovering, but as soon [ground -\>
true]{.title-ref} the aircraft is suddenly dragged to ground\</td\>
\<td\>allows to place on elevation + CG (offset)\</td\> \</tr\> \<tr\>
\<th\>own sim\'s elevation higher {F4090, width=50%}\</th\> \<td\>looks
like aircraft is crashing into ground\</td\> \<td\>underflow fixed, but
depending on when [ground -\> true]{.title-ref} the aircraft crashes
into ground, then is lifted back to ground level\</td\> \<td\>underflow
fixed, as used altitude will never below scenery elevation\</td\>
\</tr\> \</table\>
