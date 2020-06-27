---
title: Build configuration
---

*swift* uses [qmake](http://doc.qt.io/qt-5/qmake-manual.html) as its
build system. The build can be configured with JSON files, and the qmake
files can interrogate the configuration with custom qmake functions. C++
code can interrogate its configuration using
`BlackConfig::CBuildConfig`.

**Vanilla build**

By default, the build will parse a JSON file named `default.json` in the
root of the source tree. This file can be edited, but for changing your
local build configuration we recommend creating a new JSON file and
adding its filename to the `SWIFT_CONFIG_JSON` variable on your qmake
command line. This avoids git conflicts in `default.json`, as you can
add your own JSON file to your `.gitignore`.

**Command line variables**

The following variables can be set on the command line when invoking
`qmake` and have meaning when building swift:

  -------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `"SWIFT_CONFIG_JSON+=filename.json"`   Loads an additional JSON file into the configuration. The file must be in the root directory of the source tree. The path is relative to the source tree root, and the filename may not contain any special characters. Files are loaded in the order in which they are added to the variable, and `default.json` is loaded first. If a JSON file contains a key that was already set in a previously loaded JSON file, the value is overwritten with the last one to be loaded.
  `"CONFIG+=swiftNoDefaultJson"`         By default, `default.json` is loaded before any JSON files specified in the `SWIFT_CONFIG_JSON` variable. Adding this option prevents this behaviour. This should not really be needed, as each loaded JSON file can overwrite values from a previously loaded one, but the option is provided for completeness.
  `"CONFIG+=swiftNoCacheConfig"`         By default, JSON files are parsed only when processing the root `SUBDIRS` project, and saved in the cache, and the sub-projects use the cached values. This option disables this behaviour, so JSON files are reparsed for each sub-project.
  `"SWIFT_CONFIG.key=value"`             Specifies a configuration value as if it had been loaded from a JSON file after all other JSON files have been loaded. For example, `"SWIFT_CONFIG.sims.xplane=false"` to disable X-Plane support regardless what is set in any JSON file.
  -------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Accessing the configuration when writing `qmake` files


There is a custom function `swiftConfig` for inspecting the values
loaded from JSON within our qmake project files. It is provided both as
a test function and a replace function.

### `swiftConfig` test function


Create a scope with the `swiftConfig` function to conditionally evaluate
some qmake directives if and only if a specified key is set to true in
the JSON configuration. The function returns false if the key has any
other value, of if the key is not present.

**example**:

    swiftConfig(sims.p3d) {
        # directives to evaluate only if P3D is enabled
    }

{{% alert title="Note" color="primary" %}}
For technical reasons, the JSON string value `"true"` is treated the
same as the boolean value `true`. This is because in qmake,
everything is a string.
{{% /alert %}}


### `swiftConfig` replace function


Use the `swiftConfig` replace function with the `$$` sigil to retrieve
the value of a specified key from the JSON.

**example**:

    DEFINES += "BLACK_EOL=$$swiftConfig(endOfLife)"

## Modifying the configuration when writing `qmake` files

Sometimes in a qmake file you want to override the setting of the JSON
file for some reason. Some test functions are provided for this purpose.

### `setSwiftConfig` test function


Use this to set the value of a specified key.

**example**:

    setSwiftConfig(endOfLife, 19970829)

### `enableSwiftConfig` test function


This is a convenience to set the value of some key(s) to `true`.

**example**:

    # enable all Microsoft-based simulators
    enableSwiftConfig(sims.fs9, sims.fsx, sims.p3d)

### `disableSwiftConfig` test function


The reverse of `enableSwiftConfig`, this sets the value of some key(s)
to `false`.
