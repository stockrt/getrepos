module GetRepos
  module_function

  def init(filename)
    sample_json = %q({"repos": [
  {"name": "nginx", "version": "1.9.12", "url": "http://nginx.org/download/nginx-1.9.12.tar.gz"},
  {"name": "luajit", "version": "2.1.0-beta2", "url": "http://luajit.org/download/LuaJIT-2.1.0-beta2.tar.gz"},
  {"name": "pcre", "version": "8.38", "url": "http://downloads.sourceforge.net/project/pcre/pcre/8.38/pcre-8.38.tar.bz2"},
  {"name": "ngx_http_auth_request", "version": "662785733552", "url": "http://mdounin.ru/hg/ngx_http_auth_request_module/archive/tip.tar.gz", "path": "ngx_http_auth_request_module-662785733552"},
  {"name": "ngx_cache_purge", "version": "2.3", "url": "https://github.com/FRiCKLE/ngx_cache_purge/archive/2.3.zip"},
  {"name": "nginx-push-stream", "version": "0.5.1", "url": "https://github.com/wandenberg/nginx-push-stream-module.git"}
]}
)

    File.write(filename, sample_json)
    puts "Generated '#{filename}'".light_green
  end
end
