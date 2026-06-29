module SerwerSMS
  class ClientToken
    include SerwerSMS::ResourcesMixin

    def initialize(token:, **opts)
      @http = Http::HttpToken.new(token: token, **opts)
    end

    def call(path, params = {})
      @http.call(path, params)
    end
  end
end
