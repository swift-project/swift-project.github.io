---
title: git tips and tricks
---

Git Tips and Tricks

[git pull \--rebase]{.title-ref}

Suppose you've made a small change to the code that you want to
[push]{.title-ref} to the remote repository. But before you can do that,
you need to [pull]{.title-ref} some other recent changes that other
people have made, to synchronise your local repo with the remote. Here's
the situation before the `pull`:

``` {.}
* your commit == local HEAD     * their commit 2 == remote HEAD
|                               |
|                               * their commit 1
|                               |
+---------------+---------------+
                |
                * common ancestor
```

And here is what the tree would look like after an ordinary \`pull\`:

``` {.}
* merge commit == local HEAD
|
+------------------+
|                  |
* your commit      * their commit 2 == remote HEAD
|                  |
|                  * their commit 1
|                  |
+------------------+
|
* common ancestor
```

But if you used [pull \--rebase]{.title-ref} instead, the tree would
look like this:

``` {.}
* your commit == local HEAD
|
* their commit 2 == remote HEAD
|
* their commit 1
|
* common ancestor
```

This is good for small changes when you want the git history to be nice
and linear, not littered with merges that make it harder to read through
and follow. But it is potentially dangerous for anything bigger because
it changes the parent commit of your commit, which has the effect of
also changing the SHA1 of your commit, an invasive rewriting of history.

In particular, you must not use [push \--rebase]{.title-ref} if you've
already pushed your local commit to some other branch; that would be bad
because then there would be two different versions of history which
would be hard to reconcile. But if your commit only exists in your one
local branch, then you should be safe to rebase it. It could be said
that it subverts the "branch and merge" philosophy of git, but OTOH it
is a better semantic model of your intent, and that's why it's provided
as an option. See also
\[\[<http://stackoverflow.com/questions/2472254/when-should-i-use-git-pull-rebase>
\| SO question\]\] .

Committing individual hunks or lines
====================================

If you've made several logically separate changes in the same file, and
you want to put these changes into separate commits so that other
developers can more easily make sense of your changes, git-gui can help:

{F3630}

Through the right-click context menu you can choose to commit only
certain hunks or lines, instead of entire files. Do be careful, though,
that the project should be in a buildable state after each individual
commit, so if A depends on B then B should be committed first.

(A hunk is a block of one or more changes, with a header line at the top
which begins with [@]{.title-ref} [@]{.title-ref}.)

Resolving conflicts with diff3
==============================

It can be difficult when resolving conflicts, when you don\'t know the
context of the other developer\'s changes. Traditional git diff only
shows your version of the code and the other developer\'s version of the
code, which can lead to conflicts being resolved wrongly and breaking
the other developer\'s work. Git has an option to enable the diff3
conflict style, which also shows the version of the code as it was in
the common ancestor of your changes and their changes, which makes it
much easier to see exactly what changed:

[git config \--global merge.conflictstyle diff3]{.title-ref}

Fast-forward merge to another branch without touching files
===========================================================

It is a common task when working in a feature branch, to merge your
branch into the integration branch. Traditionally, you
[checkout]{.title-ref} the integration branch, then [merge]{.title-ref}
the feature branch, then [checkout]{.title-ref} the feature branch
again. If it is a fast-forward merge, then all your files will be
exactly as they were before the merge, except their timestamps will have
changed, resulting in your IDE unnecessarily rebuilding the code. There
is a trick to avoid this:

[git push . feature/T123\_foo:develop/0.9.0]{.title-ref}

[git push .]{.title-ref} means \"push to my own local repository\" and
[feature/T123\_foo:develop/0.9.0]{.title-ref} means \"update
[develop/0.9.0]{.title-ref} to point to the HEAD of
[feature/T123\_foo]{.title-ref}\". It will fail if the merge is not a
fast-forward, which is good, because we want only fast-forward merges in
integration branches.
