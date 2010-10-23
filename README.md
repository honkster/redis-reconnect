# RedisReconnect

Rack middleware which reconnects the redis connection (from redis-store).

## Usage

    use RedisReconnect, lambda {Rails.cache.instance_variable_get("@data")}
