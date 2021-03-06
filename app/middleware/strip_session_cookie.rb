module Middleware
  class StripSessionCookie
    def initialize(app, paths:)
      @app   = app
      @paths = paths
    end

    def call(env)
      if strip?(env)
        cookieless_call(env)
      else
        @app.call(env)
      end
    end

    private

    def cookieless_call(env)
      env.delete('HTTP_COOKIE')

      @app.call(env).tap do |_, headers, _|
        headers.delete('Set-Cookie')
      end
    end

    def strip?(env)
      path = Rack::Request.new(env).path
      @paths.include?(path)
    end
  end
end
