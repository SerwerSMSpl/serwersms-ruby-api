module SerwerSMS
  module Resources
    class Premium
      def initialize(client)
        @client = client
      end

      # List of received SMS Premium
      #
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :to_number   Premium number
      #     @option item [String]  :from_number Sender phone number
      #     @option item [String]  :date
      #     @option item [Integer] :limit       Limitation the number of responses
      #     @option item [String]  :text        Message
      def index(params = {})
        @client.call('premium/index', params)
      end

      # Send reply for received SMS Premium
      #
      # @param phone [String] Recipient phone number
      # @param text  [String] Message
      # @param gate  [String] Premium number
      # @param id    [Integer] ID of received SMS Premium
      # @return [Hash]
      #   @option return [Boolean] :success
      def send(phone, text, gate, id)
        @client.call('premium/send', 'phone' => phone, 'text' => text, 'gate' => gate, 'id' => id)
      end

      # View quiz results
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Integer] :id
      #   @option return [String]  :name
      #   @option return [Array]   :items
      #     @option item [Integer] :id
      #     @option item [Integer] :count Number of responses
      def quiz(id)
        @client.call('quiz/view', 'id' => id)
      end
    end
  end
end
