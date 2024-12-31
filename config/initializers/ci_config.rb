if ENV['CI']
  puts "Loading ci_config.rb" # イニシャライザが実行されていることを確認する
  require_relative "../environments/ci.rb"
  binding.irb # ブレークポイント
end
