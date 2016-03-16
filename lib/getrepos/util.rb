def is_valid_json_root?(data)
  if data[:repos].nil?
    puts 'Missing required key "repos"'.light_red
    return false
  else
    return true
  end
end

def is_valid_json_repo?(data)
  return_flag = true
  [:name, :version, :url].each do |key|
    if data[key].nil?
      puts "Missing required key \"#{key}\"".light_red
      return_flag = false
    end
  end
  return return_flag
end

def is_git_url?(url)
  if File.extname(URI(url).path) == '.git'
    return true
  else
    return false
  end
end

def run_local(command)
  response = %x(#{command})
  exit_status = $?.to_i

  if exit_status != 0
    puts "Error: #{command} (exit status: #{exit_status})"
    puts response
  end

  return exit_status
end
