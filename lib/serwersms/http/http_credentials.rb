module SerwerSMS
  module Http
    class HttpCredentials < ApiClient
      def initialize(username:, password:, **opts)
        raise SerwerSMS::Error, 'Username is empty' if username.to_s.strip.empty?
        raise SerwerSMS::Error, 'Password is empty' if password.to_s.strip.empty?

        super(**opts)

        @username = username
        @password = password
      end

      private

      def apply_auth(params)
        params['username'] = @username
        params['password'] = @password
      end
    end
  end
end
