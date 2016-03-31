ENV['REDISTOGO_URL'] ||= "redis://redistogo:3ae8e6fdc19d03116875d49b47ee8fc9@lab.redistogo.com:9610"

uri = URI.parse(ENV['REDISTOGO_URL'])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
