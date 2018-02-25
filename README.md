# CMake Include Conf Library

This module define the function that load ***.conf file and set the value to the CMake variables.

## Contents

This module sets the following function.

#### include_conf_file(filename)

Read the contents from specified file and store the values to the CMake variables.

## Usage

1. Copy cmake/IncludeConfFile.cmake to your project as you want.
2. In CMakeLists.txt, add the following statements.

```cmake
include(/path/to/IncludeConfFile.cmake)
include_conf_file(***.conf)
```

## Run Example

In Linux or Mac

```bash
$ mkdir -p example
$ cd example
$ cmake ..
```

In Command prompt on Windows

```
> mkdir example > NUL 2>&1
> cd example
> cmake.exe ..
```

If you are using command prompt, cmake.exe must be found in your %PATH% variable.
