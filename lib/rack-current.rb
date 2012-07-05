require "rack-current/version"
require 'rack-current/middleware'

module Rack::Current
  def current_request
    Thread.current[:_current_request]
  end
end
