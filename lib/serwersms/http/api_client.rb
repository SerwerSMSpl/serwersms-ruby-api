require 'net/http'
require 'json'
require 'openssl'

module SerwerSMS
  module Http
    class ApiClient
      API_URL = 'https://api2.serwersms.pl'.freeze
      SYSTEM  = 'client_ruby'.freeze

      def initialize(api_url: API_URL, timeout: 30)
        @api_url = api_url.chomp('/')
        @timeout = timeout
      end

      def call(path, params = {})
        params = params.compact
        params['system'] = SYSTEM

        apply_auth(params)

        uri = URI.parse("#{@api_url}/#{path}.json")

        Net::HTTP.start(uri.host, uri.port,
          use_ssl:      true,
          verify_mode:  OpenSSL::SSL::VERIFY_PEER,
          open_timeout: @timeout,
          read_timeout: @timeout
        ) do |http|
          request = Net::HTTP::Post.new(uri, build_headers)
          request.body = params.to_json

          response = http.request(request)

          unless response.is_a?(Net::HTTPSuccess)
            raise SerwerSMS::Error.new("HTTP #{response.code}", response.code)
          end

          result = JSON.parse(response.body)

          if result.is_a?(Hash) && result['error']
            raise SerwerSMS::Error.new(
              result.dig('error', 'message') || 'Unknown API error',
              result.dig('error', 'code')
            )
          end

          result
        end
      end

      private

      def apply_auth(_params)
        raise NotImplementedError, "#{self.class}#apply_auth not implemented"
      end

      def build_headers
        { 'Content-Type' => 'application/json' }
      end
    end
  end
end
