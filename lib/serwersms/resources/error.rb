module SerwerSMS
  module Resources
    class Error
      def initialize(client)
        @client = client
      end

      # Preview error details
      #
      # @param code [Integer]
      # @return [Hash]
      #   @option return [Integer] :code
      #   @option return [String]  :type
      #   @option return [String]  :message
      def view(code)
        @client.call("error/#{code}")
      end
    end
  end
end
