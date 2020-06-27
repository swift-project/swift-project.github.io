---
subtitle: clamp on ground
title: 'X-IVAP clamp on ground and ground handling flag'
---

Clamping only avoids \"underflow into ground\"

``` {.}
double getCorrectYValue(double inX, double inY, double inZ, double inModelYOffset, bool inIsClampingOn) {
    if (!inIsClampingOn) {
        return inY;
    }
    XPLMProbeInfo_t info;
    info.structSize = sizeof(XPLMProbeInfo_t);
    XPLMProbeResult res = XPLMProbeTerrainXYZ(terrainProbe, inX, inY, inZ, &info);
    if (res != xplm_ProbeHitTerrain) {
        return inY;
    }
    double minY = info.locationY + inModelYOffset;
    return (inY < minY) ? minY : inY;
}
```
