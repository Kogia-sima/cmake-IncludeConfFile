# Include Configure File Library
#
# This module define the function that load ***.conf file and
# set the value to the CMake variables. 
#
# This module sets the following functions
#
# ----------
#
#   include_conf_file(filename):
#
#     Read from specified file and store the values to CMake variables.
#     Allowed formats in config file are 'foo=bar' and 'foo=' (assign
#     empty string).
#
# ----------
#


function(include_conf_file filename)
  # read from specified file
  file(STRINGS "${filename}" Contents)
  
  foreach(Line ${Contents})
    # remove the comment block
    string(FIND "${Line}" "#" CommentStart)
    string(SUBSTRING "${Line}" 0 ${CommentStart} Line)

    # check if the state line format is valid
    if("${Line} " MATCHES "^ *[^ =]+ *=[^=]*$")
      # extract variable name and value
      string(REGEX REPLACE "^ *([^ =]+) *=([^=]*)$" "\\1=\\2" KeyValue ${Line})
      string(FIND "${KeyValue}" "=" EqualSymbolPosition)

      # Find variable name
      string(SUBSTRING "${KeyValue}" 0 ${EqualSymbolPosition} Key)

      # Find the value
      math(EXPR ValueStart "${EqualSymbolPosition} + 1")
      string(SUBSTRING "${KeyValue}" ${ValueStart} -1 Value)
      string(STRIP "${Value}" Value)

      # Set the variable
      set(${Key} "${Value}" PARENT_SCOPE)
    endif()
  endforeach(Line)
endfunction(include_conf_file)
