# - Try to find LibYANG and its C++ bindings
# Once done this will define
#
#  LIBYANG_FOUND - system has LibYANG
#  LIBYANG_INCLUDE_DIRS - the LibYANG include directory
#  LIBYANG_LIBRARIES - Link these to use LibYANG
#
#  LIBYANG_CPP_FOUND - system has LibYANG C++ bindings
#  LIBYANG_CPP_INCLUDE_DIRS - the LibYANG C++ include directory
#  LIBYANG_CPP_LIBRARIES - Link these to use LibYANG C++ bindings
#
#  Author Radek Krejci <rkrejci@cesnet.cz>
#  Author Michal Vasko <mvasko@cesnet.cz>
#  Copyright (c) 2015 - 2019 CESNET, z.s.p.o.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#
#  1. Redistributions of source code must retain the copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. The name of the author may not be used to endorse or promote products
#     derived from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
#  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
#  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
#  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
#  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
#  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
#  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# C library
if (LIBYANG_LIBRARIES AND LIBYANG_INCLUDE_DIRS)
  # in cache already
  set(LIBYANG_FOUND TRUE)
else ()

  find_path(LIBYANG_INCLUDE_DIR
    NAMES
      libyang/libyang.h
    PATHS
      /usr/include
      /usr/local/include
      /opt/local/include
      /sw/include
      ${CMAKE_INCLUDE_PATH}
      ${CMAKE_INSTALL_PREFIX}/include
  )

  find_library(LIBYANG_LIBRARY
    NAMES
      yang
      libyang
    PATHS
      /usr/lib
      /usr/lib64
      /usr/local/lib
      /usr/local/lib64
      /opt/local/lib
      /sw/lib
      ${CMAKE_LIBRARY_PATH}
      ${CMAKE_INSTALL_PREFIX}/lib
  )

  if (LIBYANG_INCLUDE_DIR AND LIBYANG_LIBRARY)
    set(LIBYANG_FOUND TRUE)
  else ()
    set(LIBYANG_FOUND FALSE)
  endif ()

  set(LIBYANG_INCLUDE_DIRS ${LIBYANG_INCLUDE_DIR})
  set(LIBYANG_LIBRARIES ${LIBYANG_LIBRARY})

  # show the LIBYANG_INCLUDE_DIRS and LIBYANG_LIBRARIES variables only in the advanced view
  mark_as_advanced(LIBYANG_INCLUDE_DIRS LIBYANG_LIBRARIES)

endif ()

#C++ bindings
if (LIBYANG_CPP_LIBRARIES AND LIBYANG_CPP_INCLUDE_DIRS)
  # in cache already
  set(LIBYANG_CPP_FOUND TRUE)
else ()

  find_path(LIBYANG_CPP_INCLUDE_DIR
    NAMES
      libyang/Libyang.hpp
    PATHS
      /usr/include
      /usr/local/include
      /opt/local/include
      /sw/include
      ${CMAKE_INCLUDE_PATH}
      ${CMAKE_INSTALL_PREFIX}/include
  )

  find_library(LIBYANG_CPP_LIBRARY
    NAMES
      yang-cpp
      libyang-cpp
    PATHS
      /usr/lib
      /usr/lib64
      /usr/local/lib
      /usr/local/lib64
      /opt/local/lib
      /sw/lib
      ${CMAKE_LIBRARY_PATH}
      ${CMAKE_INSTALL_PREFIX}/lib
  )

  if (LIBYANG_CPP_INCLUDE_DIR AND LIBYANG_CPP_LIBRARY)
    set(LIBYANG_CPP_FOUND TRUE)
  else ()
    set(LIBYANG_CPP_FOUND FALSE)
  endif ()

  set(LIBYANG_CPP_INCLUDE_DIRS ${LIBYANG_CPP_INCLUDE_DIR})
  set(LIBYANG_CPP_LIBRARIES ${LIBYANG_CPP_LIBRARY})

  # show the LIBYANG_CPP_INCLUDE_DIRS and LIBYANG_CPP_LIBRARIES variables only in the advanced view
  mark_as_advanced(LIBYANG_CPP_INCLUDE_DIRS LIBYANG_CPP_LIBRARIES)

endif()
