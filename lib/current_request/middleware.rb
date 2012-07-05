require 'rack'

module CurrentRequest
  class Middleware
    include CurrentRequest

    def initialize(app)
      @app = app
    end

    def call(env)
      before = current_request
      self.current_request = Rack::Request.new(env)
      @app.call(env)
    ensure
      self.current_request = before
    end
  end
end