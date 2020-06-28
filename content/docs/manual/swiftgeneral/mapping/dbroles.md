---
title: Mapping DB roles
---

swift database roles

+--------+-------------------------------------------------------------+
| role   | meaning                                                     |
+========+=============================================================+
| -      | normal user without role. Such user only see self           |
|        | adminstration in the web UI                                 |
+--------+-------------------------------------------------------------+
| alpha  | can access alpha program downloads                          |
+--------+-------------------------------------------------------------+
| bulk   | can directly add model mappings, but not change. In order   |
| add    | to directly edit `bulk` role is required                    |
+--------+-------------------------------------------------------------+
| bulk   | can perform direct uploads from swift mapping tool          |
+--------+-------------------------------------------------------------+
| m      | can create new liveries, aircraft ICAOs, airline ICAOs      |
| apping |                                                             |
| admin  |                                                             |
+--------+-------------------------------------------------------------+

When you login in the mapping tool, you will see your roles here:

![image](http://img.swift-project.org/Login_roles.png)
