---
subtitle: airline icons
title: 'Providing airline icons (VA icons, military organization icons)'
---

swift can display airline icons in its views. This is optional, but a
nice eye catcher. If you want to add missing icons please consider the
following rules:



{{% alert title="Note" color="primary" %}}
we keep different icon formats in parallel. The using application can
choose the most appropriate one
{{% /alert %}}

- ideally use a 4:1 ratio, such as 300:75px
- maximum size approx. 300:75px (see hint about hires below)
- use `png` format
- name is supposed to be the 5 digit id plus airline ICAO code, e.g. `03221_DLH.png`
    - you can see the id in the mapping tool
    - or in the datastore ICAO [view here](<https://datastore.swift-project.org/page/publicairlineicao.php>)
- if the airline is not yet available, request the airline first: [Change request](https://datastore.swift-project.org/page/changerequestairlineicao.php?clear=true)
- **do not use copyright protected icons!** Hint, check Wikipedia, they show you the copyright for each icon
- Naming scheme:

    - We might use higher resolutions in the future, you can also add a high res version like 1024:205px. In that case naming is same as above, but [hi]{.title-ref} in the middle, `06461_LHA.hi.png`, `03221_DLH.hi.png`
    - Dark optimized icons (for a black background for instance) will be using `.do` in the name.
    - Examples:
        - `03221_DLH.png` lowres version (approx 300:75)
        - `03221_DLH.do.png` lowres version, dark optimized (approx 300:75)
        - `03221_DLH.hi.png` hires version
        - `03221_DLH.do.hi.png` hires version, dark optimized
