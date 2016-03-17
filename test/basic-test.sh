#!/bin/bash

# http://bmizerany.github.io/roundup
# https://github.com/bmizerany/roundup
# wget https://raw.githubusercontent.com/bmizerany/roundup/master/roundup.sh

describe "Basic usage"

validate_build_repo() {
    # Nginx
    test -f build/repos/nginx-1.9.12/configure
    # Deps
    test -f build/repos/luajit-2.1.0-beta2/Makefile
    test -f build/repos/lua-cjson-2.1.0.3/Makefile
    test -f build/repos/hiredis-v0.13.3/Makefile
    test -f build/repos/libmaxminddb-1.1.4/Makefile.in
    # Native modules
    test -f build/repos/lua-nginx-v0.10.2/config
    test -f build/repos/lua-upstream-nginx-v0.05/config
    test -f build/repos/redis2-nginx-v0.12/config
    test -f build/repos/set-misc-nginx-v0.30/config
    test -f build/repos/ngx_cache_purge-2.3/config
    test -f build/repos/nginx-push-stream-0.5.1/config
    test -f build/repos/ngx_http_auth_request-662785733552/config
    # Lua modules
    test -d build/repos/lua-resty-core-v0.1.5/lib/resty
    test -d build/repos/lua-resty-dns-v0.15/lib/resty
    test -d build/repos/lua-resty-redis-v0.22/lib/resty
    test -d build/repos/lua-resty-upstream-healthcheck-v0.04/lib/resty
}

before() {
    rm -f init.json
    rm -rf build
}

after() {
    rm -f init.json
    rm -rf build
}

it_display_help() {
    ../bin/getrepos | grep "help documentation"
    ../bin/getrepos init | grep "getrepos init"
    ../bin/getrepos install | grep "getrepos install"
}

it_display_version() {
    ../bin/getrepos -v | grep -E "getrepos [[:digit:]]"
}

it_init() {
    ../bin/getrepos init init.json
    test -f init.json
}

it_init_force() {
    ../bin/getrepos init init.json
    test -f init.json
    ../bin/getrepos init init.json -f
}

it_init_is_valid_json() {
    ../bin/getrepos init init.json
    grep nginx-push-stream init.json
    ./helper/valid_json.rb init.json
}

it_init_generate_valid_build_repo() {
    ../bin/getrepos init init.json
    ../bin/getrepos install init.json
    validate_build_repo
}

it_install() {
    ../bin/getrepos install repos-basic.json
    validate_build_repo
}

# EOF
