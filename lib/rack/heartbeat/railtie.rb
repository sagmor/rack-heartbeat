module Rack
  class Heartbeat::Railtie < Rails::Railtie
    initializer "rack.heartbeat.register" do |app|
      app.middleware.insert 0, Rack::Heartbeat
    end
  end
end
