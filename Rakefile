require 'bundler/gem_tasks'

# Default
task :default => :help

# Help
desc 'Show help'
task :help do
  system('rake -T')
end

# Test
desc 'Run tests'
task :test do
  system('cd test && ./helper/roundup.sh')
end
