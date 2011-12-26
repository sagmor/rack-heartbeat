module Rack
  class Heartbeat
    
    OK = lambda {  [200, {"Content-Type" => "text/plain"}, ["OK"]] }

    DEFAULTS = {
      :path => '/heartbeat',
      :method => 'GET'
    }

    def initialize(app, options = {}, &block)
      @app = app
      @options = DEFAULTS.merge(options)
      @check = block || OK
    end

    def call(env)
      if env['REQUEST_METHOD'] == @options[:method] && env['PATH_INFO'] == @options[:path]
        @check.call
      else
        @app.call(env)
      end
    end
  end
end
