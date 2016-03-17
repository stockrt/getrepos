#!/bin/bash

describe "Path filtering during extraction"

before() {
    rm -rf build
}

after() {
    rm -rf build
}

it_path_filter_git() {
    ../bin/getrepos install repos-path-filter-git.json
    test -f build/repos/openresty-v1.9.7.4/nginx-0.8.54-allow_request_body_updating.patch
}

it_path_filter_tar_gz() {
    ../bin/getrepos install repos-path-filter-tar-gz.json
    test -f build/repos/openresty-1.9.7.4/nginx-0.8.54-allow_request_body_updating.patch
}

it_path_filter_zip() {
    ../bin/getrepos install repos-path-filter-zip.json
    test -f build/repos/openresty-1.9.7.4/nginx-0.8.54-allow_request_body_updating.patch
}

# EOF
