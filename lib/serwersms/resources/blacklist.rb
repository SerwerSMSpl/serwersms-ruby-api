module SerwerSMS
  module Resources
    class Blacklist
      def initialize(client)
        @client = client
      end

      # Add phone to the blacklist
      #
      # @param phone [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def add(phone)
        @client.call('blacklist/add', 'phone' => phone)
      end

      # List of blacklisted phones
      #
      # @param phone  [String]
      # @param params [Hash]
      #   @option params [Integer] :page  The number of the displayed page
      #   @option params [Integer] :limit Limit items displayed on single page
      # @return [Hash]
      #   @option return [Hash]  :paging
      #     @option paging [Integer] :page  The number of current page
      #     @option paging [Integer] :count The number of all pages
      #   @option return [Array] :items
      #     @option item [String] :phone
      #     @option item [String] :added Date of adding phone
      def index(phone = nil, params = {})
        params['phone'] = phone
        @client.call('blacklist/index', params)
      end

      # Check if phone is blacklisted
      #
      # @param phone [String]
      # @return [Hash]
      #   @option return [Boolean] :exists
      def check(phone)
        @client.call('blacklist/check', 'phone' => phone)
      end

      # Delete phone from the blacklist
      #
      # @param phone [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(phone)
        @client.call('blacklist/delete', 'phone' => phone)
      end
    end
  end
end
