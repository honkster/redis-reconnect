require "cache-store-api"

class RedisReconnect
  attr_reader :connection_getter
  def initialize(app, connection_getter)
    @app = app
    @connection_getter = connection_getter
  end

  def call(env)
    c = connection
    if c.respond_to?(:on_each_node)
      c.on_each_node :reconnect
    elsif c.respond_to?(:reconnect)
      c.reconnect
    end
    @app.call(env)
  end

  def connection
    if connection_getter.is_a?(Proc)
      connection_getter.call
    else
      connection_getter
    end
  end
end
