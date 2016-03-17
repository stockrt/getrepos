#!/bin/bash

# http://bmizerany.github.io/roundup
# https://github.com/bmizerany/roundup
# wget https://raw.githubusercontent.com/bmizerany/roundup/master/roundup.sh

describe "Basic usage"

before() {
    rm -f init.json
    rm -rf build
}

after() {
    rm -f init.json
    rm -rf build
}

validate() {
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

it_install() {
    ../bin/getrepos install repos-basic.json
    validate
}

it_init() {
    ../bin/getrepos init init.json -f
    test -f init.json
    grep nginx-push-stream init.json
}

it_init_is_valid() {
    ../bin/getrepos init init.json -f
    ../bin/getrepos install init.json
    validate
}

# EOF
