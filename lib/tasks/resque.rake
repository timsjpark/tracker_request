require 'resque/tasks'

task 'resque:setup' => :environment do
  ENV['QUEUE'] = '*'

  Resque.redis = 'localhost:6379' unless Rails.env == 'production'
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"
