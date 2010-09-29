class RedisReconnect
  attr_reader :cache_store_getter
  def initialize(app, cache_store_getter)
    require "redis-store"
    @app = app
    @cache_store_getter = cache_store_getter
  end

  def call(env)
    data = cache.instance_variable_get("@data")
    if data.respond_to?(:client) && data.client.respond_to?(:on_each_node)
      data.client.on_each_node :reconnect
    end
    @app.call(env)
  end

  def cache
    if cache_store_getter.is_a?(Proc)
      cache_store_getter.call
    else
      cache_store_getter
    end
  end
end
