module SerwerSMS
  module Resources
    class Groups
      def initialize(client)
        @client = client
      end

      # Add new group
      #
      # @param name [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def add(name)
        @client.call('groups/add', 'name' => name)
      end

      # List of groups
      #
      # @param search [String] Group name filter
      # @param params [Hash]
      #   @option params [Integer] :page  The number of the displayed page
      #   @option params [Integer] :limit Limit items displayed on single page
      #   @option params [String]  :sort  Values: name
      #   @option params [String]  :order Values: asc|desc
      # @return [Hash]
      #   @option return [Hash]  :paging
      #     @option paging [Integer] :page  The number of current page
      #     @option paging [Integer] :count The number of all pages
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :name
      #     @option item [Integer] :count Number of contacts in the group
      def index(search = nil, params = {})
        params['search'] = search
        @client.call('groups/index', params)
      end

      # View single group
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Integer] :id
      #   @option return [String]  :name
      #   @option return [Integer] :count Number of contacts in the group
      def view(id)
        @client.call('groups/view', 'id' => id)
      end

      # Edit a group
      #
      # @param id   [Integer]
      # @param name [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def edit(id, name)
        @client.call('groups/edit', 'id' => id, 'name' => name)
      end

      # Delete a group
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(id)
        @client.call('groups/delete', 'id' => id)
      end

      # View groups containing phone number
      #
      # @param phone [String]
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [Integer] :group_id
      #     @option item [String]  :group_name
      def check(phone)
        @client.call('groups/check', 'phone' => phone)
      end
    end
  end
end
