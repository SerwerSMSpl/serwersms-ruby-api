module SerwerSMS
  module Resources
    class Stats
      def initialize(client)
        @client = client
      end

      # Sending statistics
      #
      # @param params [Hash]
      #   @option params [String] :type  eco|full|voice|mms
      #   @option params [String] :begin Start date
      #   @option params [String] :end   End date
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :name
      #     @option item [Integer] :delivered
      #     @option item [Integer] :pending
      #     @option item [Integer] :undelivered
      #     @option item [Integer] :unsent
      #     @option item [String]  :begin
      #     @option item [String]  :end
      #     @option item [String]  :text
      #     @option item [String]  :type  eco|full|voice|mms
      def index(params = {})
        @client.call('stats/index', params)
      end
    end
  end
end
