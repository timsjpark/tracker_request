
if Rails.env == 'production'
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Resque.redis = Redis.new(:url => uri)
end

Dir["/app/app/jobs/*.rb"].each { |file| require file }
