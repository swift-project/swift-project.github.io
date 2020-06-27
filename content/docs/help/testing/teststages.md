---
title: Test stages
---

We will test the software in several stages. Please do not use parts not
yet released for testing.

  ------------------------------------------------------------------------------------------
  stage   date     purpose                   req. skills and prerequisites
  ------- -------- ------------------------- -----------------------------------------------
  M5      autumn   VATSIM integration test   VATSIM test team
          2018                               

  M4      summer   XPlane without Qt classes swift team, small test team outside VATSIM
          2018     and interpolation         
                   improvements              

  M3      spring   Test on smaller flight    small test team outside VATSIM
          2018     networks, gnd. flag and   
                   XPlane improvements       

  M2      mid      test distributed DBus     mostly a developer team test
          August   environment for pilot     
          17       client                    

  M1      end      test                      understand `mm`{.interpreted-text role="ref"},
          April 17 `smt`{.interpreted-text   understand aircraft ICAOs, no programming
                   role="ref"} and           skills needed, English is team language. Please
                   installation, create      `watch the tutorials <smt>`{.interpreted-text
                   mappings for tests and    role="ref"} before you start
                   future users              
  ------------------------------------------------------------------------------------------

1.  Testplan M3

    > 1.  Improve interpolation
    > 2.  Improve gnd. flag handling with various clients, also non
    >     VATSIM clients
    > 3.  XPlane improvements driver/QT library

2.  Testplan M2

    > 1.  Connect to network with DBus client
    > 2.  monitor simulation with DBus client

3.  Testplan M1:

    > 1.  Misc:
    >
    >     > 1.  **Do not fly on VATSIM yet, pilot client needs still
    >     >     improvements**
    >     > 2.  Set you a goal: Try to do at least 100, or better 2500
    >     >     mappings. This sounds a lot when you have done the first
    >     >     10, but the author has done couple of 1000s. You find
    >     >     your way to simplify the task. So you can select all
    >     >     aircraft of an airline and a distribution, then assign
    >     >     those values in 2 simple steps.
    >     > 3.  Do not give up when you find a bug. Report it and carry
    >     >     on unless it is a showstopper.
    >
    > 2.  Watch the mapping tool YouTube videos as introduction
    >
    > 3.  Download and install swift from the alpha channel
    >
    > 4.  Start the mapping tool
    >
    > 5.  Load your own models into the mapping tool
    >
    > 6.  Understand filtering
    >
    > 7.  Now pick a model not yet in the database and try to create a
    >     mapping
    >
    > 8.  Publish this model. Try to publish at least 10 models.
    >
    > 9.  Once we see you got the idea, we might upgrade your role, you
    >     can then directly update into the DB, not only create change
    >     requests
    >
    > 10. Carry on, pick you favorite AI package, and do as many
    >     mappings as you can
