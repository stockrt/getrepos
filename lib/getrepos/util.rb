def is_valid_json_root?(data)
  if data[:repos].nil?
    puts 'Missing required key "repos"'.light_red
    return false
  else
    return true
  end
end

def is_valid_json_repo?(data)
  ret_flag = true
  [:name, :version, :url].each do |key|
    if data[key].nil?
      puts "Missing required key \"#{key}\"".light_red
      ret_flag = false
    end
  end
  return ret_flag
end

def is_git_url?(url)
  if File.extname(URI(url).path) == '.git'
    return true
  else
    return false
  end
end
