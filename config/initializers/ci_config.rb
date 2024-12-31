if ENV['CI']
  puts "Loading ci_config.rb" # verify the initializer runs
  require_relative "../environments/ci.rb"
end
