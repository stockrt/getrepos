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
    dest_dir = "build/repos/#{repo[:name]}-#{repo[:version]}"
    gitbare_dest_dir = "build/.gitbare/#{repo[:name]}"

    # Clone
    if File.exists?("#{gitbare_dest_dir}/HEAD")
      puts "Already cloned '#{repo[:url]}' to '#{gitbare_dest_dir}'".light_green
    else
      puts "Cloning '#{repo[:url]}' to '#{gitbare_dest_dir}'".light_cyan
      ret = run_local("git clone -q --bare '#{repo[:url]}' '#{gitbare_dest_dir}'")
      exit ret if ret != 0
    end

    # Extract
    puts "Extracting and filtering '#{gitbare_dest_dir}' to '#{dest_dir}'".light_cyan
    prep_dest_dir(dest_dir)
    ret = run_local("cd #{gitbare_dest_dir} &&
                    git archive '#{repo[:version]}' -- #{repo[:path]} | tar xf - -C '../../.tmp/'")
    exit ret if ret != 0
    FileUtils.mv("build/.tmp/#{repo[:path]}", dest_dir)
  end

  def install_archive(repo, ext)
    dest_dir = "build/repos/#{repo[:name]}-#{repo[:version]}"
    archive_dest_file = "build/.archive/#{repo[:name]}-#{repo[:version]}.#{ext}"

    # Download
    if File.exists?(archive_dest_file)
      puts "Already downloaded '#{repo[:url]}' to '#{archive_dest_file}'".light_green
    else
      puts "Saving '#{repo[:url]}' to '#{archive_dest_file}'".light_cyan
      FileUtils.mkdir_p(File.dirname(archive_dest_file))
      IO.copy_stream(open(repo[:url]), archive_dest_file)
    end

    # Extract
    puts "Extracting and filtering '#{archive_dest_file}' to '#{dest_dir}'".light_cyan
    prep_dest_dir(dest_dir)
    ret = 0
    if ext == 'tar.gz'
      ret = run_local("tar xzf '#{archive_dest_file}' -C 'build/.tmp' #{repo[:path]}")
    elsif ext == 'tar.bz2'
      ret = run_local("tar xjf '#{archive_dest_file}' -C 'build/.tmp' #{repo[:path]}")
    elsif ext == 'tar.xz'
      ret = run_local("tar xJf '#{archive_dest_file}' -C 'build/.tmp' #{repo[:path]}")
    elsif ext == 'zip' || ext == 'jar' || ext == 'war' || ext == 'ear'
      ret = run_local("unzip -o '#{archive_dest_file}' #{repo[:path]} -d 'build/.tmp'")
    else
      puts "Unsupported file extension '#{ext}'".light_red
      exit 1
    end
    exit ret if ret != 0
    # Was the archive expanded to the usual directory 'name-version'?
    archive_usual_dir = "build/.tmp/#{repo[:name]}-#{repo[:version]}/#{repo[:path]}"
    if File.directory?(archive_usual_dir)
      FileUtils.mv(archive_usual_dir, dest_dir)
    else
      FileUtils.mv("build/.tmp/#{repo[:path]}", dest_dir)
    end
  end
end
