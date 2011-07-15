module Rack
  class Heartbeat
    DEFAULTS = {
      :path => '/heartbeat',
      :method => 'GET',
      :response => 'OK'
    }

    def initialize(app, options = {})
      @app = app
      @options = DEFAULTS.merge(options)
    end

    def call(env)
      if env['REQUEST_METHOD'] == @options[:method] && env['PATH_INFO'] == @options[:path]
        [200, {"Content-Type" => "text/plain"}, [@options[:response]]]
      else
        @app.call(env)
      end
    end
  end
end
