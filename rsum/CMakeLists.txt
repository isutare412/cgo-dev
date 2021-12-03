cmake_minimum_required(VERSION 3.13)

project(rsum)

include_directories(include)

set(SOURCE_FILES
    src/RsMath.c
)

add_library(rsum SHARED
    ${SOURCE_FILES}
)
