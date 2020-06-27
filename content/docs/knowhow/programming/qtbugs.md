---
title: Relevant known Qt bugs
---

\<table\> \<tr\> \<th\>ID\</th\> \<th\>Type\</th\>
\<th\>Description\</th\> \<th\>Status\</th\> \<th\>Fix Target\</th\>
\<th\>Severity\</th\> \<th\>Comments\</th\> \</tr\> \<tr\>
\<td\>\[QTBUG-49870\](<https://bugreports.qt.io/browse/QTBUG-49870>)\</td\>
\<td\>Bug\</td\> \<td\>On Windows, any application using QtDBus will
hang when exiting\</td\> \<td\>Fixed\</td\> \<td\>5.6\</td\>
\<td\>high\</td\> \<td\>\</td\> \</tr\> \<tr\>
\<td\>\[I596358eb\](<https://codereview.qt-project.org/#/c/168405/>)\</td\>
\<td\>Bug\</td\> \<td\>Unintended implicit conversion from
[QLatin1String]{.title-ref} to [QString]{.title-ref} in
[QJsonObject]{.title-ref}\</td\> \<td\>Fixed\</td\> \<td\>5.7.1\</td\>
\<td\>high\</td\> \<td\>For JSON performance\</td\> \</tr\> \<tr\>
\<td\>\[QTBUG-57696\](<https://bugreports.qt.io/browse/QTBUG-57696>)\</td\>
\<td\>Bug\</td\> \<td\>Build with Clang on Windows is broken (Qt
5.7.1)\</td\> \<td\>Reported\</td\> \<td\>5.8.1\</td\> \<td\>low\</td\>
\<td\>\[Workaround\](<https://codereview.qt-project.org/#/c/180240/>)\</td\>
\</tr\> \<tr\>
\<td\>\[QTBUG-57695\](<https://bugreports.qt.io/browse/QTBUG-57695>)\</td\>
\<td\>Bug\</td\> \<td\>Visual Studio IDE only: [moc]{.title-ref} always
regenerates all files even if nothing changed (Qt 5.8.0)\</td\>
\<td\>Fixed\</td\> \<td\>5.8.0\</td\> \<td\>low\</td\>
\<td\>\[Workaround\](<https://bugreports.qt.io/browse/QTBUG-57695>)\</td\>
\</tr\> \<tr\> \<td\>\</td\> \<td\>Feature\</td\>
\<td\>[QJsonObject::insert]{.title-ref} and [operator\[\]]{.title-ref}
not optimized for [QLatin1String]{.title-ref}\</td\>
\<td\>Reported\</td\> \<td\>{icon question}\</td\> \<td\>high\</td\>
\<td\>For JSON performance\</td\> \</tr\> \<tr\>
\<td\>\[QTBUG-53031\](<https://bugreports.qt.io/browse/QTBUG-53031>)\</td\>
\<td\>Bug\</td\> \<td\>Windows application deadlocks on exit when
unloading a library connected to DBus\</td\> \<td\>Fixed\</td\>
\<td\>5.8.1\</td\> \<td\>low\</td\> \<td\>Fixed in 5.6 but regressed
again in 5.8.0\</td\> \</tr\> \<tr\>
\<td\>\[QTBUG-51543\](<https://bugreports.qt.io/browse/QTBUG-51543>)\</td\>
\<td\>Bug\</td\> \<td\>[QNetworkAccessManager]{.title-ref} spuriously
becomes [NotAccessible]{.title-ref} on Windows, app must be
restarted\</td\> \<td\>Fixed {icon question}\</td\> \<td\>5.8.1\</td\>
\<td\>high\</td\> \<td\>Fix awaiting confirmation\</td\> \</tr\> \<tr\>
\<td\>\[QTBUG-75361\](<https://bugreports.qt.io/browse/QTBUG-75361>)\</td\>
\<td\>Bug\</td\> \<td\>Stylesheets not applied to all widgets\</td\>
\<td\>Open\</td\> \<td\>5.12.4, 5.13\</td\> \<td\>high\</td\>
\<td\>\</td\> \</tr\> \</table\>
