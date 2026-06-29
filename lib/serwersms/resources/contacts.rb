module SerwerSMS
  module Resources
    class Contacts
      def initialize(client)
        @client = client
      end

      # Add new contact
      #
      # @param group_id [Integer]
      # @param phone    [String]
      # @param params   [Hash]
      #   @option params [String] :email
      #   @option params [String] :first_name
      #   @option params [String] :last_name
      #   @option params [String] :company
      #   @option params [String] :tax_id
      #   @option params [String] :address
      #   @option params [String] :city
      #   @option params [String] :description
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def add(group_id, phone, params = {})
        params['group_id'] = group_id
        params['phone']    = phone
        @client.call('contacts/add', params)
      end

      # List of contacts
      #
      # @param group_id [Integer]
      # @param search   [String]
      # @param params   [Hash]
      #   @option params [Integer] :page  The number of the displayed page
      #   @option params [Integer] :limit Limit items displayed on single page
      #   @option params [String]  :sort  Values: first_name|last_name|phone|company|tax_id|email|address|city|description
      #   @option params [String]  :order Values: asc|desc
      # @return [Hash]
      #   @option return [Hash]  :paging
      #     @option paging [Integer] :page  The number of current page
      #     @option paging [Integer] :count The number of all pages
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :phone
      #     @option item [String]  :email
      #     @option item [String]  :company
      #     @option item [String]  :first_name
      #     @option item [String]  :last_name
      #     @option item [String]  :tax_id
      #     @option item [String]  :address
      #     @option item [String]  :city
      #     @option item [String]  :description
      #     @option item [Boolean] :blacklist
      #     @option item [Integer] :group_id
      #     @option item [String]  :group_name
      def index(group_id = nil, search = nil, params = {})
        params['group_id'] = group_id.nil? ? 'none' : group_id
        params['search']   = search
        @client.call('contacts/index', params)
      end

      # View single contact
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Integer] :id
      #   @option return [String]  :phone
      #   @option return [String]  :email
      #   @option return [String]  :company
      #   @option return [String]  :first_name
      #   @option return [String]  :last_name
      #   @option return [String]  :tax_id
      #   @option return [String]  :address
      #   @option return [String]  :city
      #   @option return [String]  :description
      #   @option return [Boolean] :blacklist
      def view(id)
        @client.call('contacts/view', 'id' => id)
      end

      # Edit a contact
      #
      # @param id       [Integer]
      # @param group_id [Integer, Array]
      # @param phone    [String]
      # @param params   [Hash]
      #   @option params [String] :email
      #   @option params [String] :first_name
      #   @option params [String] :last_name
      #   @option params [String] :company
      #   @option params [String] :tax_id
      #   @option params [String] :address
      #   @option params [String] :city
      #   @option params [String] :description
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def edit(id, group_id, phone, params = {})
        params['id']       = id
        params['group_id'] = group_id
        params['phone']    = phone
        @client.call('contacts/edit', params)
      end

      # Delete a contact
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(id)
        @client.call('contacts/delete', 'id' => id)
      end

      # Import contact list
      #
      # @param group_name [String]
      # @param contact    [Array]
      #   @option contact [String] :phone
      #   @option contact [String] :email
      #   @option contact [String] :first_name
      #   @option contact [String] :last_name
      #   @option contact [String] :company
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      #   @option return [Integer] :correct Number of contacts imported correctly
      #   @option return [Integer] :failed  Number of errors
      def import(group_name, contact = [])
        @client.call('contacts/import', 'group_name' => group_name, 'contact' => contact)
      end
    end
  end
end
