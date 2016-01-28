class Serwersms::Blacklist
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Add phone to the blacklist
   * 
   * param string $phone
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def add(phone)
     params = {} 
     params['phone']  = phone
     @serwersms.call('blacklist/add',params);
   end
   '''
   * List of blacklist phones
   * 
   * param string phone
   * param array params
   *      option int "page" The number of the displayed page
   *      option int "limit" Limit items are displayed on the single page
   * return array
   *      option array "paging"
   *          option int "page" The number of current page
   *          option int "count" The number of all pages
   *      option array "items"
   *          option string "phone"
   *          option string "added" Date of adding phone
   '''
   def index(phone = nil, params = {})
     params['phone']  = phone
     @serwersms.call('blacklist/index',params);
   end
   '''
   * Checking if phone is blacklisted
   * 
   * param string phone
   * return array
   *      option bool "exists"
   '''
   def check(phone)
     params = {}
     params['phone']  = phone
     @serwersms.call('blacklist/check',params);
   end
   '''
   * Deleting phone from the blacklist
   * 
   * param string phone
   * return array
   *      option bool "success"
   '''
   def delete(phone)
     params = {}
     params['phone']  = phone
     @serwersms.call('blacklist/delete',params);
   end
  
end