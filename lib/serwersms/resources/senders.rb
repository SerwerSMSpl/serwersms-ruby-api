module SerwerSMS
  module Resources
    class Senders
      def initialize(client)
        @client = client
      end

      # Create new sender name
      #
      # @param name [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      def add(name)
        @client.call('senders/add', 'name' => name)
      end

      # List of senders
      #
      # @param params [Hash]
      #   @option params [Boolean] :predefined
      #   @option params [String]  :sort  Values: name
      #   @option params [String]  :order Values: asc|desc
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [String] :name
      #     @option item [String] :agreement  delivered|required|not_required
      #     @option item [String] :status     pending_authorization|authorized|rejected|deactivated
      def index(params = {})
        @client.call('senders/index', params)
      end
    end
  end
end
