web: bundle exec rails server
worker1: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
worker2: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
worker3: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
worker4: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
worker5: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
worker6: bundle exec rake resque:work TERM_CHILD=1 QUEUES=*
scheduler: bundle exec rake environment resque:scheduler
tail: tail -f log/development.log
