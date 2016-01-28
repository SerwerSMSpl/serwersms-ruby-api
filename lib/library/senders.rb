class Serwersms::Senders
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Creating new Sender name
   * 
   * param string name
   * return array
   *      option bool "success"
   '''
   def add(name)
     params = {}
     params['name']   = name
     @serwersms.call('senders/add',params);
   end
  
   '''
   * Senders list
   * 
   * param array params
   *      option bool "predefined"
     *      option string "sort" Values: name
     *      option string "order" Values: asc|desc
   * return array
   *      option array "items"
   *          option string "name"
   *          option string "agreement" delivered|required|not_required
   *          option string "status" pending_authorization|authorized|rejected|deactivated
   '''
   def index(params = {})
     @serwersms.call('senders/index',params);
   end
  
end