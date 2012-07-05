require "current_request/version"
require 'current_request/middleware'

module CurrentRequest
  def current_request
    Thread.current[:_current_request]
  end

  def current_request=(request)
    Thread.current[:_current_request] = request
  end
end
