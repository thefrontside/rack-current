require 'rack'

module Rack::Current
  class Middleware
    include Rack::Current

    def initialize(app)
      @app = app
    end

    def call(env)
      before = self.current_request
      self.current_request = Rack::Request.new(env)
      @app.call(env)
    ensure
      self.current_request = before
    end

    private

    def current_request=(request)
      Thread.current[:_current_request] = request
    end
  end
end