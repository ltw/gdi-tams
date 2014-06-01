Resque.after_fork do
  ActiveRecord::Base.establish_connection
  Resque.redis = Redis.new(url: ENV['REDISCLOUD_URL'])
end