---
title: Rebasing and conflicts
---

From
\[\[<https://dev.vatsim-germany.org/boards/22/topics/2236?r=2251#message-2251>
\| Redmine\]\]

As a result of working through the branch in the live session yesterday
I think I got a bit closer to understanding the reasons for the conflict
issues which have occurred with Klaus' previous two branches, so I think
I can try to offer some lessons learned, in the form of a kind of
standard model for doing rebasing.

\#\#\# The branch

-   The purpose of pushing branches is so that changes can be reviewed
    before being merged. Therefore, a branch has done its job well if it
    is easy to review, and a branch that is easier to review can be
    merged sooner.
-   The more changes are in a branch, the more potential there is for
    conflicts, so avoid making a branch any bigger than it needs to be.

\#\#\# The first version

-   Throughout the process of making changes in a branch, keep one eye
    on the git log which you are creating, and try to see it from the
    point of view of a reviewer. With each change that you make, ask
    yourself "am I changing something which I already changed in an
    earlier commit in the same branch?" If yes, then it is very likely
    to make sense for it to be fixed-up onto that earlier commit,
    instead of making a separate commit for something which is just a
    continuation of it. This will mean that the reviewer doesn't waste
    time reviewing several different versions of your code. A reviewer
    must review *changes*, but he really only cares about the *final
    state* of your code, not the intermediate states.
-   Applying this model continuously at every step of the coding process
    is much easier than trying to do the fixing-up all at the very end.
-   Use the [fixup! message]{.title-ref} to create a commit which should
    fix-up an earlier commit of the same branch, to utilize the
    "autosquash" facility of [git rebase -i]{.title-ref}. There is no
    need to change the message of the earlier commit if it still makes
    sense.

\#\#\# Rebasing on the latest master

-   It can commonly take up to a couple of weeks (sometimes longer) to
    finish the first version of a branch. In that time, it is likely
    that [master]{.title-ref} will have changed, so that the base of
    your branch is out-of-date. Another use of [git rebase]{.title-ref}
    (without the [-i]{.title-ref}) is to bring the base of a branch
    up-to-date with the latest [master]{.title-ref}. This will need to
    be done before the merge anyway, so it makes sense to do it before
    the review, so that any resulting problems can be caught by the
    review.
-   After rebasing onto the latest [master]{.title-ref}, if you find
    that you need to make some changes to resolve some issues arising
    from conflicts, then those changes should be fix-ups onto the
    commits in your branch which triggered the conflicts. This will
    avoid triggering the same conflicts again if you need to rebase onto
    the latest [master]{.title-ref} again.
-   As described above, [git rebase -i]{.title-ref} and [git
    rebase]{.title-ref} (without the [-i]{.title-ref}) are used for two
    different purposes. You shouldn't try to do both in a single step.
    Always do [git rebase -i]{.title-ref} to apply any \@fixup! message
