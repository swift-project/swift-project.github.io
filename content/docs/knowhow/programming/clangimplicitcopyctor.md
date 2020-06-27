---
title: 'CLANG \"implicit copy constructor\"'
---

`CLANG warning: definition of implicit copy assignment operator for 'CMeasurementUnit' is deprecated because it has a user-declared destructor`

Solution:

``` {.diff}
//! Destructor
~CMeasurementUnit() = default;
+
+    //! Copy constructor
+    CMeasurementUnit(const CMeasurementUnit &) = default;
+
+    //! Copy assignment operator
+    CMeasurementUnit &operator =(const CMeasurementUnit &) = default;
```
