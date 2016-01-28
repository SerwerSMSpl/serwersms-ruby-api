class Serwersms::Accounts
  def initialize(obj)
      @serwersms = obj
  end
  '''
   * Register new account
   * 
   * param array params
   *      option string "phone"
   *      option string "email"
   *      option string "first_name"
   *      option string "last_name"
   *      option string "company"
   * return array
   *      option bool "success"
   '''
   def add( params = {} )
     @serwersms.call('account/add',params);
   end
   '''
   * Register new account
   * Return limits SMS
   * 
   * return array
   *      option array "items"
   *          option string "type" Type of message
   *          option string "chars_limit" The maximum length of message
   *          option string "value" Limit messages
   * 
   '''
   def limits()
     params = {} 
     @serwersms.call('account/limits',params);
   end
   '''
   * Return contact details
   * 
   * return array
   *      option string "telephone"
   *      option string "email"
   *      option string "form"
   *      option string "faq"
   *      option array "quardian_account"
   *          option string "name"
   *          option string "email"
   *          option string "telephone"
   *          option string "photo"
   '''
   def help()
     params = {} 
     @serwersms.call('account/help',params);
   end
   '''
   * Return messages from the administrator
   * 
   * return array
   *      option bool "new" Marking unread message
   *      option string "message" 
   '''
   def messages()
     params = {} 
     @serwersms.call('account/messages',params);
   end
 
end