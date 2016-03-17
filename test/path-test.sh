#!/bin/bash

describe "Path filtering"

before() {
    rm -rf build
}

after() {
    rm -rf build
}

it_filter_path() {
    ../bin/getrepos install repos-path.json

    test -f build/repos/openresty-v1.9.7.4/nginx-0.8.54-allow_request_body_updating.patch
}

# EOF
