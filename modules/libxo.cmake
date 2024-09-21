# SPDX-FileCopyrightText: 2023 Carl Zeiss Microscopy GmbH
#
# SPDX-License-Identifier: MIT

ExternalProject_Add(
  libxo_ext
  PREFIX             "${CMAKE_BINARY_DIR}/vendor/libxo"
  BINARY_DIR         "${CMAKE_BINARY_DIR}/vendor/libxo/src/libxo_ext/build"
  GIT_REPOSITORY     https://github.com/Juniper/libxo
  GIT_TAG            origin/main
  CONFIGURE_COMMAND  ${CMAKE_COMMAND} -E chdir ${CMAKE_BINARY_DIR}/vendor/libxo/src/libxo_ext sh bin/setup.sh && ${CMAKE_COMMAND} -E chdir ${CMAKE_BINARY_DIR}/vendor/libxo/src/libxo_ext/build ../configure
  BUILD_COMMAND      ${CMAKE_COMMAND} -E chdir ${CMAKE_BINARY_DIR}/vendor/libxo/src/libxo_ext/build make
  INSTALL_COMMAND    ""
)

ExternalProject_Get_Property(libxo_ext source_dir)
set(LIBXO_INCLUDE_DIR ${source_dir})
set(LIBXO_LIB_DIR ${LIBXO_INCLUDE_DIR}/build/libxo)
