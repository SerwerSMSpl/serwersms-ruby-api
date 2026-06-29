module SerwerSMS
  module Http
    class HttpToken < ApiClient
      def initialize(token:, **opts)
        raise SerwerSMS::Error, 'Token is empty' if token.to_s.strip.empty?

        super(**opts)

        @token = token
      end

      private

      def apply_auth(_params)
        # token przekazywany przez nagłówek Authorization, nie w body
      end

      def build_headers
        super.merge('Authorization' => "Bearer #{@token}")
      end
    end
  end
end
