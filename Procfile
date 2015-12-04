web: bundle exec rails server
worker: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
tail: tail -f log/development.log
