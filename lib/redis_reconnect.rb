require "cache-store-api"

class RedisReconnect
  def initialize(app)
    @app = app
  end

  def call(env)
    data = CacheStoreApi.cache.instance_variable_get("@data")
    if data.respond_to?(:client) && data.client.respond_to?(:on_each_node)
      CacheStoreApi.cache.instance_variable_get("@data").client.on_each_node :reconnect
    end
    @app.call(env)
  end
end
