require 'getrepos/util'

module GetRepos
  module_function

  def install(filename)
    FileUtils.mkdir_p('build/repos')
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

      puts
      puts 'Processing entry: '.light_cyan + repo.to_s
      if is_git_url?(repo[:url])
        # Git
        install_git(repo)
      else
        # Archive
        archive = URI(repo[:url]).path
        if archive.end_with?('.tar.gz')
          install_archive(repo, 'tar.gz')
        elsif archive.end_with?('.tar.bz2')
          install_archive(repo, 'tar.bz2')
        elsif archive.end_with?('.tar.xz')
          install_archive(repo, 'tar.xz')
        elsif archive.end_with?('.zip')
          install_archive(repo, 'zip')
        elsif archive.end_with?('.jar')
          install_archive(repo, 'jar')
        elsif archive.end_with?('.war')
          install_archive(repo, 'war')
        elsif archive.end_with?('.ear')
          install_archive(repo, 'ear')
        else
          puts "Unsupported file extension in URL '#{repo[:url]}'".light_red
          exit 1
        end
      end
    end
  end

  def install_git(repo)
    dest_dir = File.join('build', 'repos', repo[:name] + '-' + repo[:version])
    gitbare_dest_dir = File.join('build', '.gitbare', repo[:name])

    # Clone
    if File.exists?("#{gitbare_dest_dir}/HEAD")
      puts "Already cloned '#{repo[:url]}' to '#{gitbare_dest_dir}'".light_green
    else
      puts "Cloning '#{repo[:url]}' to '#{gitbare_dest_dir}'".light_cyan
      ret = run_local("git clone -q --bare '#{repo[:url]}' '#{gitbare_dest_dir}'")
      exit ret if ret != 0
    end

    # Extract
    puts "Extracting '#{gitbare_dest_dir}' to '#{dest_dir}'".light_cyan
    FileUtils.rm_rf(dest_dir)
    FileUtils.mkdir_p(dest_dir)
    ret = run_local("cd #{gitbare_dest_dir} &&
                    git archive --prefix='#{dest_dir}/' '#{repo[:version]}' -- #{repo[:path]} | tar xf - -C '../../../'")
    exit ret if ret != 0
  end

  def install_archive(repo, ext)
    dest_dir = File.join('build', 'repos', repo[:name] + '-' + repo[:version])
    dest_file = File.join('build', 'repos', repo[:name] + '-' + repo[:version] + '.' + ext)

    # Download
    if File.exists?(dest_file)
      puts "Already downloaded '#{repo[:url]}' to '#{dest_file}'".light_green
    else
      puts "Saving '#{repo[:url]}' to '#{dest_file}'".light_cyan
      FileUtils.mkdir_p(File.dirname(dest_file))
      IO.copy_stream(open(repo[:url]), dest_file)
    end

    # Extract
    puts "Extracting '#{dest_file}' to '#{dest_dir}'".light_cyan
    FileUtils.rm_rf(dest_dir)
    FileUtils.mkdir_p(dest_dir)
    ret = 0
    if ext == 'tar.gz'
      ret = run_local("tar xzf '#{dest_file}' -C '#{dest_dir}'")
    elsif ext == 'tar.bz2'
      ret = run_local("tar xjf '#{dest_file}' -C '#{dest_dir}'")
    elsif ext == 'tar.xz'
      ret = run_local("tar xJf '#{dest_file}' -C '#{dest_dir}'")
    elsif ext == 'zip' || ext == 'jar' || ext == 'war' || ext == 'ear'
      ret = run_local("unzip -o '#{dest_file}' -d '#{dest_dir}'")
    else
      puts "Unsupported file extension '#{ext}'".light_red
      exit 1
    end
    exit ret if ret != 0
  end
end
