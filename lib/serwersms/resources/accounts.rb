module SerwerSMS
  module Resources
    class Accounts
      def initialize(client)
        @client = client
      end

      # Register new account
      #
      # @param params [Hash]
      #   @option params [String] :phone
      #   @option params [String] :email
      #   @option params [String] :first_name
      #   @option params [String] :last_name
      #   @option params [String] :company
      # @return [Hash]
      #   @option return [Boolean] :success
      def add(params = {})
        @client.call('account/add', params)
      end

      # Return SMS limits for account
      #
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [String] :type       Type of message
      #     @option item [String] :chars_limit Maximum length of message
      #     @option item [String] :value       Limit messages
      def limits(params = {})
        @client.call('account/limits', params)
      end

      # Return contact details
      #
      # @return [Hash]
      #   @option return [String] :telephone
      #   @option return [String] :email
      #   @option return [String] :form
      #   @option return [String] :faq
      #   @option return [Hash]   :guardian_account
      #     @option guardian_account [String] :name
      #     @option guardian_account [String] :email
      #     @option guardian_account [String] :telephone
      #     @option guardian_account [String] :photo
      def help(params = {})
        @client.call('account/help', params)
      end

      # Return messages from the administrator
      #
      # @return [Hash]
      #   @option return [Boolean] :new     Marking unread message
      #   @option return [String]  :message
      def messages(params = {})
        @client.call('account/messages', params)
      end
    end
  end
end
