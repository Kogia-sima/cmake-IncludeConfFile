cmake_minimum_required(VERSION 2.4)
project(example)

include(cmake/IncludeConfFile.cmake)

include_conf_file(example.conf)

message(STATUS "var1 = \"${var1}\"")
message(STATUS "var2 = \"${var2}\"")
message(STATUS "var3 = \"${var3}\"")
message(STATUS "var4 = \"${var4}\"")
message(STATUS "var5 = \"${var5}\"")
