module SerwerSMS
  module Resources
    class Templates
      def initialize(client)
        @client = client
      end

      # List of templates
      #
      # @param params [Hash]
      #   @option params [String] :sort  Values: name
      #   @option params [String] :order Values: asc|desc
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :name
      #     @option item [String]  :text
      def index(params = {})
        @client.call('templates/index', params)
      end

      # Add new template
      #
      # @param name [String]
      # @param text [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def add(name, text)
        @client.call('templates/add', 'name' => name, 'text' => text)
      end

      # Edit a template
      #
      # @param id   [Integer]
      # @param name [String]
      # @param text [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :id
      def edit(id, name, text)
        @client.call('templates/edit', 'id' => id, 'name' => name, 'text' => text)
      end

      # Delete a template
      #
      # @param id [Integer]
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(id)
        @client.call('templates/delete', 'id' => id)
      end
    end
  end
end
