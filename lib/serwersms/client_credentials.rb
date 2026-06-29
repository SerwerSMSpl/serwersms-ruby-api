module SerwerSMS
  class ClientCredentials
    include SerwerSMS::ResourcesMixin

    def initialize(username:, password:, **opts)
      @http = Http::HttpCredentials.new(username: username, password: password, **opts)
    end

    def call(path, params = {})
      @http.call(path, params)
    end
  end
end
