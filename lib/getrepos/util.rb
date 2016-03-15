def is_valid_json_root?(data)
  if data[:repos].nil?
    puts 'Missing required "repos" key'.light_red
    return false
  else
    return true
  end
end

def is_valid_json_repo?(data)
  ret_flag = true
  [:name, :version, :url].each do |key|
    if data[key].nil?
      puts "Missing required \"#{key}\" key".light_red
      ret_flag = false
    end
  end
  return ret_flag
end
