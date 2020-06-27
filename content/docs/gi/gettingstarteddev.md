---
title: Getting started as a developer
---


{{% alert title="TODO" color="warning" %}}
This page contains outdated information!
{{% /alert %}}


## Getting the code

- Follow the link to rSWIFTPILOTCLIENT and click on the green button to clone the git repository. The http(s) URL can be used for anonymous read access. To use the ssh URL you must upload an ssh public key (see next steps below).
- Run `git submodule update --init` to clone the submodules.
- Download and install the latest LTS version of Qt from <https://www.qt.io/download-qt-installer>.
- Run Qt Creator and open the project file `swift.pro` in the root of your git clone.

## Next steps

- Before submitting your contributions to us, you need to [register](https://dev.swift-project.org/auth/start/) a username here in Phabricator.
    - Make sure you can receive emails sent from `*.swift-project.org` and `swiftnoreply(at)gmail.com` (check your spam filters).
- Once you have registered, you will be able to:
    - Sign the contributor license agreement to allow us to use your contributions.
    - Push Differential patches (similar to a <i class="fab fa-github"></i> pull request)
    - Upload your public key for ssh access to the git repository.
        - Settings can be found at
        - `https://dev.swift-project.org/settings/user/\<username\>/page/ssh/`