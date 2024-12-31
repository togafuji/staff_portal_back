if ENV['CI']
  Rails.application.config.after_initialize do
      puts "Loading ci.rb config through after_initialize"
      require_relative "../environments/ci.rb"
   end
end
