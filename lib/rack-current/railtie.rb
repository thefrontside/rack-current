module Rack::Current
  class Railtie < Rails::Railtie
    initializer 'rack-current.inject_middleware' do |app|
      app.middleware.use Rack::Current::Middleware
    end
  end
end