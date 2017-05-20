#!/usr/bin/env bash
function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    if [ -n "$IS_OSX" ]; then return; fi
    yum install -y libxml2 libxlst1 libxslt1-dev python-dev
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import sys; import lxml.etree, lxml.objectify; sys.exit(lxml.test())'
}