cmake_minimum_required(VERSION 3.20)
project(ramsey LANGUAGES C CXX)

if(NOT UNIX)
    message(FATAL_ERROR "The ramsey frontend requires POSIX file and process APIs.")
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(NAUTY_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/third-party/nauty" CACHE PATH
    "Existing local nauty checkout or installation")
find_path(NAUTY_INCLUDE_DIR nauty.h
    PATHS "${NAUTY_ROOT}/build" "${NAUTY_ROOT}/include" "${NAUTY_ROOT}"
    NO_DEFAULT_PATH)
find_path(NAUTY_SOURCE_INCLUDE_DIR nausparse.h
    PATHS "${NAUTY_ROOT}/src" "${NAUTY_ROOT}/include" "${NAUTY_ROOT}"
    NO_DEFAULT_PATH)
if(NOT NAUTY_INCLUDE_DIR OR NOT NAUTY_SOURCE_INCLUDE_DIR
   OR NOT EXISTS "${NAUTY_INCLUDE_DIR}/gtools.h")
    message(FATAL_ERROR
        "Configured local nauty headers are missing. Provide NAUTY_ROOT, "
        "NAUTY_INCLUDE_DIR (nauty.h and gtools.h), and NAUTY_SOURCE_INCLUDE_DIR "
        "(nausparse.h). This build never configures or downloads dependencies.")
endif()

# nauty's own build uses nauty.a rather than the usual libnauty.a spelling.
if(NOT DEFINED NAUTY_LIBRARY AND EXISTS "${NAUTY_ROOT}/build/nauty.a")
    set(NAUTY_LIBRARY "${NAUTY_ROOT}/build/nauty.a" CACHE FILEPATH "Local nauty static library")
endif()
find_library(NAUTY_LIBRARY NAMES nauty.a libnauty.a nauty
    PATHS "${NAUTY_ROOT}/build" "${NAUTY_ROOT}/build/.libs" "${NAUTY_ROOT}/lib"
    NO_DEFAULT_PATH)
if(NAUTY_LIBRARY)
    if(NOT EXISTS "${NAUTY_LIBRARY}")
        message(FATAL_ERROR "NAUTY_LIBRARY does not exist: ${NAUTY_LIBRARY}")
    endif()
    add_library(ramsey_nauty STATIC IMPORTED)
    set_target_properties(ramsey_nauty PROPERTIES IMPORTED_LOCATION "${NAUTY_LIBRARY}")
else()
    # Reuse already-configured headers; compile only local library sources into
    # this build directory, never modifying the third-party source checkout.
    set(nauty_sources)
    foreach(source nauty nautil nausparse naugraph schreier naurng gtnauty nautinv gtools)
        set(path "${NAUTY_ROOT}/src/${source}.c")
        if(NOT EXISTS "${path}")
            message(FATAL_ERROR
                "No local nauty library and missing source ${path}. Provide a "
                "prebuilt static library with -DNAUTY_LIBRARY=/path/to/nauty.a.")
        endif()
        list(APPEND nauty_sources "${path}")
    endforeach()
    add_library(ramsey_nauty STATIC ${nauty_sources})
    set_target_properties(ramsey_nauty PROPERTIES C_STANDARD 11 C_STANDARD_REQUIRED YES)
    target_include_directories(ramsey_nauty PRIVATE
        "${NAUTY_INCLUDE_DIR}" "${NAUTY_SOURCE_INCLUDE_DIR}")
endif()


add_library(ramsey_core STATIC src/engine.cpp src/opb.cpp)
target_include_directories(ramsey_core PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/src")
target_include_directories(ramsey_core SYSTEM PRIVATE
    "${NAUTY_INCLUDE_DIR}" "${NAUTY_SOURCE_INCLUDE_DIR}")
target_link_libraries(ramsey_core PRIVATE ramsey_nauty)

add_executable(ramsey src/main.cpp)
target_link_libraries(ramsey PRIVATE ramsey_core)
target_compile_definitions(ramsey_core PRIVATE
    RAMSEY_ROUNDINGSAT="${CMAKE_CURRENT_SOURCE_DIR}/third-party/roundingsat/build/roundingsat")

function(ramsey_warnings target)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(${target} PRIVATE -Wall -Wextra -Wpedantic)
    endif()
endfunction()
ramsey_warnings(ramsey_core)
ramsey_warnings(ramsey)

include(CTest)
if(BUILD_TESTING)
    add_executable(engine_tests tests/test_engine.cpp)
    target_link_libraries(engine_tests PRIVATE ramsey_core)
    ramsey_warnings(engine_tests)
    add_test(NAME engine COMMAND engine_tests)
endif()
