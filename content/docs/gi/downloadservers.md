---
title: swift download servers requirements and explanation
---

## Organizational issues

Thanks for considering helping us by providing download capacity.
Unfortunately these things require some administration and legal
guidelines nowadays.

-   As we need to reach you we prefer you create an account on this site. By that we can create an user group of those who provide download capacities, and create information only visible for you.
-   Also we have a place where we can find your email information in case we need to contact you. We do not expect a lot of issues, but we need a chance to get in touch with you.
-   Currently we will only use EU based servers for legal reasons. New new data protection laws are easier to fulfill with EU based servers, other countries have different regulations and we absolutely no capacity to check legal requirements world wide. We are programmers not lawyers.
    -   We will inform the users that they download from an external site.
    -   If possible, disable all tracking, cookies whatsoever from the download directory, otherwise we would need to have a user agreement for that.
    -   Are you using Google Analytics etc.? Please exclude the download site. Again, we would need the users to agree with that.

## Copying the artifacts

Our release management system will copy the versions via `sftp` to the
download servers. We will provide our public ssh keys, so you can allow
us to do so. Alternatively you can provide a user/password combination,
or even both

One swift version contains 4 platform downloads, around 50MB in size. So
each version will occupy around 200MB. As we plan to keep some versions
in parallel, we expect 2GB of disk size would be sufficient.

On your side we need a directory we can maintain, nothing more. We
should be able to maintain that directory and add/delete files, and
create sub directories as needed.

We will publish public beta and stable versions on your server,
developer test versions (\"alpha\" versions) reside on our server only.

That directory needs to be accessible via `http/s` with a neutral URL.
Neutral means the URL shall not contain any offensive terms or such, but
apart from that anything is fine: Example:
<http://datastore.swift.siliconmind.de/artifacts/>. You can allow
directory browsing.

Besides the files we will place a static index.html file in that
directory. If you can manage, this file shall be displayed in case the
user provides a directory URL. This page will roughly look like this:

Furthermore we will create redirect URLs like
<https://download1.swift-project.net/> and if you can manage to accept
these URLs, fine.

So as a summary: If your URL is <http://foo.bar/swiftdownloads>

- <http://foo.bar/swiftdownloads/>\<swift version\> needs to work
- <https://download>\<1\>.swift-project.net/\<swift version\> would be nice if it works
- <http://foo.bar/swiftdownloads/> and <https://download>\<1\>.swift-project.net/ would be nice to display index.html
- directory browsing is OK

## Bandwidth


We plan to have 5 download sites for the beginning. Maybe we set up 1-2
spare sites (just configured, but not in URL download list). So what
traffic are we expecting?

Honestly we have no idea, but we will learn that after we go public
beta. The math is simple:

If we expect 1000 people per week (updates, new downloads etc.) to
download swift, that makes 50MBx1000 =\> 50GB =\> 10GB per site (5
sites). As said, we have absolutely no idea how many of downloads we are
facing.

Currently we have no incremental installer, maybe we are able to create
one in the future to reduce bandwidth.
