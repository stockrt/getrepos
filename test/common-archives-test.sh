#!/bin/bash

describe "Common archive packages handling (tar.gz/tgz, tar.bz2, tar.xz, zip, jar)"

before() {
    rm -rf build
}

after() {
    rm -rf build
}

it_common_httpd_tar_gz() {
    ../bin/getrepos install repos-common-httpd-tar-gz.json
    test -f build/repos/httpd-2.4.18/configure
}

it_common_httpd_tar_bz2() {
    ../bin/getrepos install repos-common-httpd-tar-bz2.json
    test -f build/repos/httpd-2.4.18/configure
}

it_common_mod_fcgid_tar_gz() {
    ../bin/getrepos install repos-common-mod_fcgid-tar-gz.json
    test -f build/repos/mod_fcgid-2.3.9/configure.apxs
}

it_common_mod_fcgid_tar_bz2() {
    ../bin/getrepos install repos-common-mod_fcgid-tar-bz2.json
    test -f build/repos/mod_fcgid-2.3.9/configure.apxs
}

it_common_python_tgz() {
    ../bin/getrepos install repos-common-python-tgz.json
    test -f build/repos/python-3.5.1/configure
}

it_common_python_tar_xz() {
    ../bin/getrepos install repos-common-python-tar-xz.json
    test -f build/repos/python-3.5.1/configure
}

it_common_ruby_tar_gz() {
    ../bin/getrepos install repos-common-ruby-tar-gz.json
    test -f build/repos/ruby-2.3.0/configure
}

it_common_ruby_tar_bz2() {
    ../bin/getrepos install repos-common-ruby-tar-bz2.json
    test -f build/repos/ruby-2.3.0/configure
}

it_common_ruby_tar_xz() {
    ../bin/getrepos install repos-common-ruby-tar-xz.json
    test -f build/repos/ruby-2.3.0/configure
}

it_common_ruby_zip() {
    ../bin/getrepos install repos-common-ruby-zip.json
    test -f build/repos/ruby-2.3.0/configure
}

# EOF
