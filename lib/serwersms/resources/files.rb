module SerwerSMS
  module Resources
    class Files
      def initialize(client)
        @client = client
      end

      # Add new file
      #
      # @param type   [String] mms|voice
      # @param params [Hash]
      #   @option params [String] :url  URL address to file
      #   @option params [String] :name File name
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [String]  :id
      def add(type, params = {})
        params['type'] = type
        @client.call('files/add', params)
      end

      # List of files
      #
      # @param type [String] mms|voice
      # @return [Hash]
      #   @option return [Array] :items
      #     @option item [String]  :id
      #     @option item [String]  :name
      #     @option item [Integer] :size
      #     @option item [String]  :type mms|voice
      #     @option item [String]  :date
      def index(type)
        @client.call('files/index', 'type' => type)
      end

      # View file details
      #
      # @param id   [String]
      # @param type [String] mms|voice
      # @return [Hash]
      #   @option return [String]  :id
      #   @option return [String]  :name
      #   @option return [Integer] :size
      #   @option return [String]  :type mms|voice
      #   @option return [String]  :date
      def view(id, type)
        @client.call('files/view', 'id' => id, 'type' => type)
      end

      # Delete a file
      #
      # @param id   [String]
      # @param type [String] mms|voice
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(id, type)
        @client.call('files/delete', 'id' => id, 'type' => type)
      end
    end
  end
end
