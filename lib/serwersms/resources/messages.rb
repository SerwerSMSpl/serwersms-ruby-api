module SerwerSMS
  module Resources
    class Messages
      def initialize(client)
        @client = client
      end

      # Send SMS message
      #
      # @param phone  [String]
      # @param text   [String] Message content
      # @param sender [String] Sender name — only for FULL SMS
      # @param params [Hash]
      #   @option params [Boolean] :details   Show details of messages
      #   @option params [Boolean] :utf       Change encoding to UTF-8 (only for FULL SMS)
      #   @option params [Boolean] :flash
      #   @option params [Boolean] :speed     Priority canal — only for FULL SMS
      #   @option params [Boolean] :test      Test mode
      #   @option params [Boolean] :vcard     vCard message
      #   @option params [String]  :wap_push  WAP Push URL address
      #   @option params [String]  :date      Set the date of sending
      #   @option params [Integer] :group_id  Sending to the group instead of a phone number
      #   @option params [Integer] :contact_id Sending to phone from contacts
      #   @option params [String]  :unique_id Own identifiers of messages
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :queued  Number of queued messages
      #   @option return [Integer] :unsent  Number of unsent messages
      #   @option return [Array]   :items
      #     @option item [String]  :id
      #     @option item [String]  :phone
      #     @option item [String]  :status    queued|unsent
      #     @option item [String]  :queued    Date of enqueued
      #     @option item [Integer] :parts     Number of parts
      #     @option item [Integer] :error_code
      #     @option item [String]  :error_message
      #     @option item [String]  :text
      def send_sms(phone, text, sender = nil, params = {})
        params['phone']  = phone
        params['text']   = text
        params['sender'] = sender
        @client.call('messages/send_sms', params)
      end

      # Send personalized messages
      #
      # @param messages [Array]
      #   @option message [String] :phone
      #   @option message [String] :text
      # @param sender [String] Sender name — only for FULL SMS
      # @param params [Hash]
      #   @option params [Boolean]       :details  Show details of messages
      #   @option params [Boolean]       :utf      Change encoding to UTF-8 (only for FULL SMS)
      #   @option params [Boolean]       :flash
      #   @option params [Boolean]       :speed    Priority canal — only for FULL SMS
      #   @option params [Boolean]       :test     Test mode
      #   @option params [String]        :date     Set the date of sending
      #   @option params [Integer,Array] :group_id Sending to the group instead of a phone number
      #   @option params [String]        :text     Message if group_id is set
      #   @option params [String,Array]  :unique_id Own identifiers of messages
      #   @option params [Boolean]       :voice    Send VMS
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :queued
      #   @option return [Integer] :unsent
      #   @option return [Array]   :items
      def send_personalized(messages, sender = nil, params = {})
        params['messages'] = messages
        params['sender']   = sender
        @client.call('messages/send_personalized', params)
      end

      # Send Voice message
      #
      # @param phone  [String]
      # @param params [Hash]
      #   @option params [String]        :text       Text to speech
      #   @option params [String]        :file_id    ID of wav file
      #   @option params [String]        :date       Set the date of sending
      #   @option params [Boolean]       :test       Test mode
      #   @option params [Integer,Array] :group_id   Sending to the group instead of a phone number
      #   @option params [Integer,Array] :contact_id Sending to phone from contacts
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :queued
      #   @option return [Integer] :unsent
      #   @option return [Array]   :items
      def send_voice(phone, params = {})
        params['phone'] = phone
        @client.call('messages/send_voice', params)
      end

      # Send MMS
      #
      # @param phone  [String, Array]
      # @param title  [String] Title of message (max 40 chars)
      # @param params [Hash]
      #   @option params [String]        :file_id  File ID
      #   @option params [String,Array]  :file     File in base64 encoding
      #   @option params [String]        :date     Set the date of sending
      #   @option params [Boolean]       :test     Test mode
      #   @option params [Integer,Array] :group_id Sending to the group instead of a phone number
      # @return [Hash]
      #   @option return [Boolean] :success
      #   @option return [Integer] :queued
      #   @option return [Integer] :unsent
      #   @option return [Array]   :items
      def send_mms(phone, title, params = {})
        params['phone'] = phone
        params['title'] = title
        @client.call('messages/send_mms', params)
      end

      # Send message to ND/SC number
      #
      # @param phone [String] Sender phone number
      # @param text  [String] Message
      # @return [Hash]
      #   @option return [Boolean] :success
      def send_nd(phone, text)
        @client.call('messages/send_nd', 'phone' => phone, 'text' => text)
      end

      # Send message to NDI/SCI number
      #
      # @param phone      [String] Sender phone number
      # @param text       [String] Message
      # @param ndi_number [String] Recipient phone number
      # @return [Hash]
      #   @option return [Boolean] :success
      def send_ndi(phone, text, ndi_number)
        @client.call('messages/send_ndi', 'phone' => phone, 'text' => text, 'ndi_number' => ndi_number)
      end

      # View single message
      #
      # @param id     [String]
      # @param params [Hash]
      #   @option params [String]  :unique_id
      #   @option params [Boolean] :show_contact Show details of the recipient from contacts
      # @return [Hash]
      #   @option return [String] :id
      #   @option return [String] :phone
      #   @option return [String] :status  delivered|undelivered|sent|unsent|in_progress|saved
      #   @option return [String] :queued  Date of enqueued
      #   @option return [String] :sent    Date of sending
      #   @option return [String] :delivered Date of delivery
      #   @option return [String] :sender
      #   @option return [String] :type    eco|full|mms|voice
      #   @option return [String] :text
      #   @option return [String] :reason  message_expired|unsupported_number|message_rejected|
      #                                    missed_call|wrong_number|limit_exhausted|lock_send|
      #                                    wrong_message|operator_error|wrong_sender_name|
      #                                    number_is_blacklisted|sending_to_foreign_networks_is_locked|
      #                                    no_permission_to_send_messages|other_error
      #   @option return [Hash]   :contact
      def view(id, params = {})
        params['id'] = id
        @client.call('messages/view', params)
      end

      # Check message delivery reports
      #
      # @param params [Hash]
      #   @option params [String,Array]  :id           Message ID
      #   @option params [String,Array]  :unique_id    Message unique ID
      #   @option params [String,Array]  :phone
      #   @option params [String]        :date_from    Start date
      #   @option params [String]        :date_to      End date
      #   @option params [String]        :status       delivered|undelivered|pending|sent|unsent
      #   @option params [String]        :type         eco|full|mms|voice
      #   @option params [Integer]       :stat_id      Package ID
      #   @option params [Boolean]       :show_contact Show details of the recipient from contacts
      #   @option params [Integer]       :page         The number of the displayed page
      #   @option params [Integer]       :limit        Limit items displayed on single page
      #   @option params [String]        :order        asc|desc
      # @return [Hash]
      #   @option return [Hash]  :paging
      #     @option paging [Integer] :page
      #     @option paging [Integer] :count
      #   @option return [Array] :items
      def reports(params = {})
        @client.call('messages/reports', params)
      end

      # List of received messages
      #
      # @param type   [String] eco|nd|ndi|mms
      # @param params [Hash]
      #   @option params [String]  :ndi       Filtering by NDI
      #   @option params [String]  :phone     Filtering by phone
      #   @option params [String]  :date_from Start date
      #   @option params [String]  :date_to   End date
      #   @option params [Boolean] :read      Mark as read
      #   @option params [Integer] :page      The number of the displayed page
      #   @option params [Integer] :limit     Limit items displayed on single page
      #   @option params [String]  :order     asc|desc
      # @return [Hash]
      #   @option return [Hash]  :paging
      #   @option return [Array] :items
      #     @option item [Integer] :id
      #     @option item [String]  :type      eco|nd|ndi|mms
      #     @option item [String]  :phone
      #     @option item [String]  :received  Date of received message
      #     @option item [String]  :message_id ID of outgoing message (only for ECO SMS)
      #     @option item [Boolean] :blacklist  Is the phone blacklisted?
      #     @option item [String]  :text       Message
      #     @option item [String]  :to_number  Number of the recipient (for MMS)
      #     @option item [String]  :title      Title of message (for MMS)
      #     @option item [Array]   :attachments (for MMS)
      #     @option item [Hash]    :contact
      def received(type, params = {})
        params['type'] = type
        @client.call('messages/received', params)
      end

      # Delete message from the scheduler
      #
      # @param id        [String]
      # @param unique_id [String]
      # @return [Hash]
      #   @option return [Boolean] :success
      def delete(id, unique_id = nil)
        @client.call('messages/delete', 'id' => id, 'unique_id' => unique_id)
      end
    end
  end
end
