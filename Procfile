web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque: ENV['RACK_ENV'] TERM_CHILD=1 QUEUE=* bundle exec rake resque:work