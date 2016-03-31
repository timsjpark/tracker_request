web: bundle exec puma -C config/puma.rb
worker1: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
scheduler: bundle exec rake environment resque:scheduler
tail: tail -f log/development.log
