require 'spec_helper'

describe Rack::Current::Middleware do
  describe "inside an application's middleware stack" do
    include Rack::Current
    before do
      @app = mock(:app)
      @middleware = Rack::Current::Middleware.new(@app)
    end
    describe "when I invoke it" do
      before do
        @app.stub(:call) do |env|
          @env = env
          @current_request = current_request
        end
        @middleware.call({:request => :env})
      end
      it "makes the current request available" do
        @current_request.should be_kind_of Rack::Request
        @current_request.env.should eql ({:request => :env})
      end
      it "invokes the upstream app" do
        @env.should eql ({:request => :env})
      end
    end
  end
end
