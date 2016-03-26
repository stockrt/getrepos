module GetRepos
  module_function

  def init(filename)
    sample_json = %q({"repos": [
  // Nginx
  {"name": "nginx", "version": "1.9.12", "url": "http://nginx.org/download/nginx-1.9.12.tar.gz"},
  // Deps
  {"name": "luajit", "version": "2.1.0-beta2", "url": "http://luajit.org/download/LuaJIT-2.1.0-beta2.tar.gz", "path": "LuaJIT-2.1.0-beta2"},
  {"name": "lua-cjson", "version": "2.1.0.3", "url": "https://github.com/openresty/lua-cjson.git"},
  {"name": "hiredis", "version": "v0.13.3", "url": "https://github.com/redis/hiredis.git"},
  {"name": "libmaxminddb", "version": "1.1.4", "url": "https://github.com/maxmind/libmaxminddb/releases/download/1.1.4/libmaxminddb-1.1.4.tar.gz"},
  // Native modules
  {"name": "lua-nginx", "version": "v0.10.2", "url": "https://github.com/openresty/lua-nginx-module.git"},
  {"name": "lua-upstream-nginx", "version": "v0.05", "url": "https://github.com/openresty/lua-upstream-nginx-module.git"},
  {"name": "redis2-nginx", "version": "v0.12", "url": "https://github.com/openresty/redis2-nginx-module.git"},
  {"name": "set-misc-nginx", "version": "v0.30", "url": "https://github.com/openresty/set-misc-nginx-module.git"},
  {"name": "ngx_cache_purge", "version": "2.3", "url": "https://github.com/FRiCKLE/ngx_cache_purge/archive/2.3.tar.gz"},
  {"name": "nginx-push-stream", "version": "0.5.1", "url": "https://github.com/wandenberg/nginx-push-stream-module.git"},
  {"name": "ngx_http_auth_request", "version": "662785733552", "url": "http://mdounin.ru/hg/ngx_http_auth_request_module/archive/tip.tar.gz", "path": "ngx_http_auth_request_module-662785733552"},
  // Lua modules
  {"name": "lua-resty-core", "version": "v0.1.5", "url": "https://github.com/openresty/lua-resty-core.git"},
  {"name": "lua-resty-dns", "version": "v0.15", "url": "https://github.com/openresty/lua-resty-dns.git"},
  {"name": "lua-resty-redis", "version": "v0.22", "url": "https://github.com/openresty/lua-resty-redis.git"},
  {"name": "lua-resty-upstream-healthcheck", "version": "v0.04", "url": "https://github.com/openresty/lua-resty-upstream-healthcheck.git"},
  // Strange
  {"name": "log4j", "version": "1.2.17", "url": "https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar"}
]}
)

    File.write(filename, sample_json)
    puts "Generated '#{filename}'".light_green
  end
end
