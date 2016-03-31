
uri = URI.parse(ENV.fetch("REDISTOGO_URL", "redis://localhost:6379/"))
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["/app/app/jobs/*.rb"].each { |file| require file }
