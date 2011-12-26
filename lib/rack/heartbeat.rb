module Rack
  class Heartbeat
    DEFAULTS = {
      :path => '/heartbeat',
      :method => 'GET'
    }

    def self.check(&block)
      @check = block if block
      @check || lambda { }
    end

    def initialize(app, options = {}, &block)
      @app = app
      @options = DEFAULTS.merge(options)
      @check = block
    end

    def check!
      ( @check || self.class.check ).call
      true
    rescue
      false
    end

    def call(env)
      if env['REQUEST_METHOD'] == @options[:method] && env['PATH_INFO'] == @options[:path]
        if check!
          [200, {"Content-Type" => "text/plain"}, ["OK"]]
        else
          [500, {"Content-Type" => "text/plain"}, ["FAILURE"]]
        end
      else
        @app.call(env)
      end
    end
  end
end

require 'rack/heartbeat/railtie' if defined?(Rails)
