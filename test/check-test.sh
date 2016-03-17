#!/bin/bash

describe "Check for absent and invalid values inside config JSON"

before() {
    rm -rf build
}

after() {
    rm -rf build
}

it_check_absent_all() {
    set +e
    ret=$(../bin/getrepos install repos-check-absent-all.json)
    set -e
    echo "$ret" | grep 'Missing required key'
    echo "$ret" | grep 'Invalid JSON entry.*missing required field'
}

it_check_absent_name() {
    set +e
    ret=$(../bin/getrepos install repos-check-absent-name.json)
    set -e
    echo "$ret" | grep 'Missing required key "name"'
    echo "$ret" | grep 'Invalid JSON entry.*missing required field'
}

it_check_absent_repos() {
    set +e
    ret=$(../bin/getrepos install repos-check-absent-repos.json)
    set -e
    echo "$ret" | grep 'Missing required key "repos"'
    echo "$ret" | grep 'Invalid JSON.*missing required field'
}

it_check_absent_url() {
    set +e
    ret=$(../bin/getrepos install repos-check-absent-url.json)
    set -e
    echo "$ret" | grep 'Missing required key "url"'
    echo "$ret" | grep 'Invalid JSON entry.*missing required field'
}

it_check_absent_version() {
    set +e
    ret=$(../bin/getrepos install repos-check-absent-version.json)
    set -e
    echo "$ret" | grep 'Missing required key "version"'
    echo "$ret" | grep 'Invalid JSON entry.*missing required field'
}

it_check_invalid_filetype() {
    set +e
    ret=$(../bin/getrepos install repos-check-invalid-filetype.json)
    set -e
    echo "$ret" | grep 'Unsupported file extension in URL'
}

# EOF
