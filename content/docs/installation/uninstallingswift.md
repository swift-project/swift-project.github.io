---
title: Uninstalling swift
---
{{% alert title="Note" color="primary" %}}
Uninstalling *swift* **does not uninstall the settings**, you can
delete them as shown [here]({{< ref "findcachefiles" >}}):. Or see directory delete below.
{{% /alert %}}


## You have multiple options to uninstall swift

-   Via the normal OS features. **This is what you should normally do**, however it uninstalls the program only, but the data are not deleted. See below on how to delete the data directory.

- You could also start the uninstaller directly from your swift directory.
    - Windows: As the directory itself is being opened in the Explorer in such a case, it can happen some files/sub-directories remain - just delete them manually after uninstaller completes.
    - It can also happen the DBus files are still in used can also cause the `share` directory NOT to be deleted, again, just delete it manually.

- **Directory delete:** A *swift* installation consist of 2 directories
    - delete the program directory, this removes the swift program only, not the settings
    - delete the data directory. You can delete *swift* data directories from the \"other versions\" context menu in the wizard, if you still have another version installed. Or just go to the directory a delete it.
    ![image](http://img.swift-project.org/deletedatadir.png)
    - You can also just delete the data directory for your version, that looks like a fresh install, see [here]({{< ref "userdata" >}})

## Cleaning up the Windows registry

If you install with the installer you might want to delete the following
entries (example for 0.8.5)

-   `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\swift 0.8.5`
-   `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\swift 0.8.5`

*swift* only stores its windows geometry in the registry, You can delete
all registry entries from the launcher tools:

![image](http://img.swift-project.org/clearreg.png)
