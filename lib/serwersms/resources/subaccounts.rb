module SerwerSMS
  module Resources
    class Subaccounts
      def initialize(client)
        @client = client
      end

      # Create new subaccount
      #
      # @param subaccount_username [String]
      # @param subaccount_password [String]
      # @param subaccount_id       [Integer] Subaccount ID used as permissions template
      # @param params              [Hash]
      #   @option params [String] :name
      #   @option params [String] :phone
      #   @option params [String] :email
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def add(subaccount_username, subaccount_password, subaccount_id, params = {})
        params['subaccount_username'] = subaccount_username
        params['subaccount_password'] = subaccount_password
        params['subaccount_id']       = subaccount_id
        @client.call('subaccounts/add', params)
      end

      # List of subaccounts
      #
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :username
      def index(params = {})
        @client.call('subaccounts/index', params)
      end

      # View subaccount details
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Integer] :id
      #   @option return [String]  :username
      #   @option return [String]  :name
      #   @option return [String]  :phone
      #   @option return [String]  :email
      def view(id)
        @client.call('subaccounts/view', 'id' => id)
      end

      # Set limit on subaccount
      #
      # @param id    [Integer]
      # @param type  [String]  eco|full|voice|mms|hlr
      # @param value [Integer]
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def limit(id, type, value)
        @client.call('subaccounts/limit', 'id' => id, 'type' => type, 'value' => value)
      end

      # Delete a subaccount
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(id)
        @client.call('subaccounts/delete', 'id' => id)
      end
    end
  end
end
