module Rack
  class Heartbeat
    DEFAULT_BLOCK = lambda { }

    OK = [200, {"Content-Type" => "text/plain"}, ["OK"]]
    FAIL = [500, {"Content-Type" => "text/plain"}, ["FAILURE"]]

    DEFAULTS = {
      :path => '/heartbeat',
      :method => 'GET'
    }

    def initialize(app, options = {}, &block)
      @app = app
      @options = DEFAULTS.merge(options)
      @check = block || DEFAULT_BLOCK
    end

    def call(env)
      if env['REQUEST_METHOD'] == @options[:method] && env['PATH_INFO'] == @options[:path]
        begin
          @check.call
          OK
        rescue
          FAIL
        end
      else
        @app.call(env)
      end
    end
  end
end
