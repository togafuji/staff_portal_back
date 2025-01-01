if ENV['CI']
  Rails.logger.info "Loading ci_config.rb" # verify the initializer runs
  require_relative "../environments/ci"
end
