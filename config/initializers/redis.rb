
if ENV['REDISTOGO_URL'].blank?
  uri = '127.0.0.1:6379'
  REDIS = uri
else
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:url => uri)
end

Resque.redis = REDIS
Dir["/app/app/jobs/*.rb"].each { |file| require file }
