module Rack
  class Heartbeat::Railtie < Rails::Railtie
    initializer "rack.heartbeaat.register" do
      middleware.insert 0, Rack::Heartbeat
    end
  end
end
