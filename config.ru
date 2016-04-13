# This file is used by Rack-based servers to start the application.
require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {:size => 1}
end

require 'sidekiq/web'
map '/sidekiq' do
  use Rack::Auth::Basic, "This is a restricted zone" do |username, password|
    username == ENV['SIDEKIQ_USER'] && password == ENV['SIDEKIQ_PASSWORD']
  end
  run Sidekiq::Web
end

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
