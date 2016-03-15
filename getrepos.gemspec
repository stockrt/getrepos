# coding: utf-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'getrepos/version'

Gem::Specification.new do |spec|
  spec.name          = 'getrepos'
  spec.version       = GetRepos::VERSION
  spec.authors       = ['Rogério Schneider']
  spec.email         = ['stockrt@gmail.com']
  spec.summary       = %q(Get content from repositories and URLs)
  spec.description   = %q(Download, expand and filter content from Git and
  Tarball repositories into local directories.  Works similar to a Berksfile or
  a librarian-puppet catalog but is not coupled to any technology other than
  keeping a directory filled with exploded archives from remote repositories
  and URLs.  For example, it can be used to download Nginx modules before
  compiling.)

  spec.homepage      = 'https://github.com/stockrt/getrepos'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('commander', '~> 4.4')
end
