require 'json'

module GetRepos
  def install_repos(filename)
    repos = JSON.parse(open(filename).read)
    puts repos
  end

  module_function :install_repos
end
