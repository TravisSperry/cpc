require 'flipper'

Flipper.configure do |config|
  config.default do
    adapter = if Rails.env.test?
                require 'flipper/adapters/memory'
                Flipper::Adapters::Memory.new
              else
                require 'flipper/adapters/redis'
                client = Redis.new
                Flipper::Adapters::Redis.new(client)
              end
    Flipper.new(adapter)
  end
end
