require 'spec_helper'

require 'rails'
require 'action_controller/railtie'
require 'rack-current/railtie'


describe "When loaded into a Rails application" do
  before do
    @app = Class.new(Rails::Application) do
      config.active_support.deprecation = :ignore
    end
    @app.initialize!
  end

  it "injects the current request middleware into the application stack" do
    @app.middleware.should include Rack::Current::Middleware
  end
end