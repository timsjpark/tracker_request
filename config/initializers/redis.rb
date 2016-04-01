
#uri = URI.parse(ENV["REDISTOGO_URL"])
#REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Resque.redis = Redis.connect(:url => ENV['REDISTOGO_URL'])
Dir["/app/app/jobs/*.rb"].each { |file| require file }
