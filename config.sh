#!/usr/bin/env bash
# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]
#function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
#}

function bdist_with_static_deps {
    local abs_wheelhouse=$1
    python setup.py clean
    CFLAGS="-O3 -mtune=generic -pipe -fPIC";export CFLAGS
    make wheel_static
    cp dist/*.whl $abs_wheelhouse
}

function build_wheel {
    build_wheel_cmd "bdist_with_static_deps" $@
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import sys; import lxml.etree, lxml.objectify'
}