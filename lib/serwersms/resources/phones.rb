module SerwerSMS
  module Resources
    class Phones
      def initialize(client)
        @client = client
      end

      # Check phone via HLR
      #
      # @param phone [String]
      # @param id    [String] Query ID returned if processing takes longer than 60 seconds
      # @return [Hash]
      #   @option return [String]  :phone
      #   @option return [String]  :status
      #   @option return [Integer] :imsi
      #   @option return [String]  :network
      #   @option return [Boolean] :ported
      #   @option return [String]  :network_ported
      def check(phone, id = nil)
        @client.call('phones/check', 'phone' => phone, 'id' => id)
      end

      # Validate phone number
      #
      # @param phone [String]
      # @return [Hash]
      #   @option return [Boolean] :correct
      def test(phone)
        @client.call('phones/test', 'phone' => phone)
      end
    end
  end
end
