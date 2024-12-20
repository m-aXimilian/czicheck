# SPDX-FileCopyrightText: 2023 Carl Zeiss Microscopy GmbH
#
# SPDX-License-Identifier: MIT
include(FetchContent)

FetchContent_Declare(
  RapidJSON
  GIT_REPOSITORY https://github.com/Tencent/rapidjson.git
  GIT_TAG        815e6e7e7e14be44a6c15d9aefed232ff064cad0 # master as of 2024-09-24
  PREFIX "${CMAKE_BINARY_DIR}/vendor/rapidjson"
)

if (NOT RapidJSON_POPULATED)
  set(RAPIDJSON_BUILD_DOC OFF CACHE BOOL "" FORCE)
  set(RAPIDJSON_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
  set(RAPIDJSON_BUILD_TESTS OFF CACHE BOOL "" FORCE)
  FetchContent_MakeAvailable(RapidJSON)

  set(RAPIDJSON_INCLUDE_DIRS ${rapidjson_SOURCE_DIR}/include)
endif()

message(STATUS "RapidJson include dir at " ${RAPIDJSON_INCLUDE_DIRS})
message(STATUS "RapidJson with std::string support: " ${RAPIDJSON_HAS_STDSTRING})