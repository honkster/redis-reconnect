# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'redis-reconnect/version'

Gem::Specification.new do |s|
  s.name        = "redis-reconnect"
  s.version     = RedisReconnect::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Takita"]
  s.email       = ["brian@honk.com"]
  s.homepage    = "http://github.com/honkster/redis-reconnect"
  s.summary     = "Rack middleware which reconnects the redis connection (from redis-store)."
  s.description = "Rack middleware which reconnects the redis connection (from redis-store)."

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
end
