# getrepos

### Installation

```bash
gem install getrepos
```

### Usage

```bash
getrepos -h/--help
```

```bash
  NAME:

    getrepos

  DESCRIPTION:

    Download, extract and filter content from repositories (Git/Tarball)

  COMMANDS:

    help    Display global or [command] help documentation
    init    Create sample JSON
    install Download and install archives

  GLOBAL OPTIONS:

    -h, --help
        Display help documentation

    -v, --version
        Display version information
```

```bash
getrepos init
```

```bash
  NAME:

    init

  SYNOPSIS:

    getrepos init <file.json> [-f]

  DESCRIPTION:

    Create <file.json> with sample configuration

  EXAMPLES:

    # Generate repos.json
    getrepos init repos.json

    # Overwrite repos.json
    getrepos init repos.json -f

  OPTIONS:

    -f, --force
        Force file overwrite
```

```bash
getrepos install
```

```bash
  NAME:

    install

  SYNOPSIS:

    getrepos install <file.json>

  DESCRIPTION:

    Download and install archives from URLs defined in <file.json>

  EXAMPLES:

    # Process URLs from repos.json
    getrepos install repos.json
```

### Sample JSON config file

```bash
getrepos init repos.json
```

* repos.json with some Nginx modules

```json
{"repos": [
  {"name": "nginx", "version": "1.9.12", "url": "http://nginx.org/download/nginx-1.9.12.tar.gz"},

  {"name": "luajit", "version": "2.1.0-beta2", "url": "http://luajit.org/download/LuaJIT-2.1.0-beta2.tar.gz", "path": "LuaJIT-2.1.0-beta2"},
  {"name": "lua-cjson", "version": "2.1.0.3", "url": "https://github.com/openresty/lua-cjson.git"},
  {"name": "hiredis", "version": "v0.13.3", "url": "https://github.com/redis/hiredis.git"},
  {"name": "libmaxminddb", "version": "1.1.4", "url": "https://github.com/maxmind/libmaxminddb/releases/download/1.1.4/libmaxminddb-1.1.4.tar.gz"},

  {"name": "lua-nginx", "version": "v0.10.2", "url": "https://github.com/openresty/lua-nginx-module.git"},
  {"name": "lua-upstream-nginx", "version": "v0.05", "url": "https://github.com/openresty/lua-upstream-nginx-module.git"},
  {"name": "redis2-nginx", "version": "v0.12", "url": "https://github.com/openresty/redis2-nginx-module.git"},
  {"name": "set-misc-nginx", "version": "v0.30", "url": "https://github.com/openresty/set-misc-nginx-module.git"},
  {"name": "ngx_cache_purge", "version": "2.3", "url": "https://github.com/FRiCKLE/ngx_cache_purge/archive/2.3.tar.gz"},
  {"name": "nginx-push-stream", "version": "0.5.1", "url": "https://github.com/wandenberg/nginx-push-stream-module.git"},
  {"name": "ngx_http_auth_request", "version": "662785733552", "url": "http://mdounin.ru/hg/ngx_http_auth_request_module/archive/tip.tar.gz", "path": "ngx_http_auth_request_module-662785733552"},

  {"name": "lua-resty-core", "version": "v0.1.5", "url": "https://github.com/openresty/lua-resty-core.git"},
  {"name": "lua-resty-dns", "version": "v0.15", "url": "https://github.com/openresty/lua-resty-dns.git"},
  {"name": "lua-resty-redis", "version": "v0.22", "url": "https://github.com/openresty/lua-resty-redis.git"},
  {"name": "lua-resty-upstream-healthcheck", "version": "v0.04", "url": "https://github.com/openresty/lua-resty-upstream-healthcheck.git"},

  {"name": "log4j", "version": "1.2.17", "url": "https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar"}
]}
```

* Result after installation

```bash
getrepos install repos.json
tree -L 2 build

build
└── repos
    ├── hiredis-v0.13.3
    ├── libmaxminddb-1.1.4
    ├── log4j-1.2.17
    ├── lua-cjson-2.1.0.3
    ├── lua-nginx-v0.10.2
    ├── lua-resty-core-v0.1.5
    ├── lua-resty-dns-v0.15
    ├── lua-resty-redis-v0.22
    ├── lua-resty-upstream-healthcheck-v0.04
    ├── lua-upstream-nginx-v0.05
    ├── luajit-2.1.0-beta2
    ├── nginx-1.9.12
    ├── nginx-push-stream-0.5.1
    ├── ngx_cache_purge-2.3
    ├── ngx_http_auth_request-662785733552
    ├── redis2-nginx-v0.12
    └── set-misc-nginx-v0.30
```
