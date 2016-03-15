require 'getrepos/util'

module GetRepos
  def install(filename)
    repos = JSON.parse(open(filename).read, symbolize_names: true)

    unless is_valid_json_root?(repos)
      puts "Invalid JSON '#{filename}' (missing required field)".light_red
      exit 1
    end

    repos[:repos].each do |repo|
      unless is_valid_json_repo?(repo)
        puts "Invalid JSON entry '#{repo}' (missing required field)".light_red
        exit 1
      end

      dest_dir = File.join('build', 'repos', repo[:name] + '-' + repo[:version])
      git_bare_dest_dir = File.join('build', '.gitbare', repo[:name])
      FileUtils.mkdir_p('build')
      puts repo
      if is_git_url?(repo[:url])
      else
      end
    end
  end

  module_function :install
end
