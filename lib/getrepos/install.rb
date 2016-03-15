module GetRepos
  def install_repos(filename)
    repos = JSON.parse(open(filename).read, symbolize_names: true)
    if repos[:repos].nil?
      puts "Invalid JSON '#{filename}' (missing \"repos\" key)".light_red
      exit 1
    end
    repos[:repos].each do |repo|
      puts repo
    end
  end

  module_function :install_repos
end
