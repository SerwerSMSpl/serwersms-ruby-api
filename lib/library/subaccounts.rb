class Serwersms::Subaccounts
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Creating new subaccount
   * 
   * param string $subaccount_username
   * param string $subaccount_password
   * param int $subaccount_id Subaccount ID, which is template of powers
   * param array $params
   *      option string "name"
   *      option string "phone"
   *      option string "email"
   * return type
   '''
   def add(subaccount_username, subaccount_password, subaccount_id, params = {})

     params['subaccount_username']  = subaccount_username
     params['subaccount_password']  = subaccount_password
     params['subaccount_id']        = subaccount_id
     @serwersms.call('subaccounts/add',params);
   end
 
   '''
   * List of subaccounts
   * 
   * return array
   *      option array "items"
   *          option int "id"
   *          option string "username"
   '''
   def index()
     params = {}
     @serwersms.call('subaccounts/index',params);
   end
  
   '''
   * View details of subaccount
   * 
   * param int $id
   * return array
   *      option int "id"
   *      option string "username"
   *      option string "name"
   *      option string "phone"
   *      option string "email"
   '''
   def view(id)
     params = {}
     params['id']  = id
     @serwersms.call('subaccounts/view',params);
   end
   
   '''
   * Setting the limit on subaccount
   * 
   * param int $id
   * param string $type Message type: eco|full|voice|mms|hlr
   * param int $value
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def limit(id, type, value)
     params = {}
     params['id']     = id
     params['type']   = type
     params['value']  = value
     @serwersms.call('subaccounts/limit',params);
   end
   
   '''
   * Deleting a subaccount
   * 
   * param int $id
   * return array
   *      option bool "success"
   '''
   def delete(id)
     params = {}
     params['id']     = id
     @serwersms.call('subaccounts/delete',params);
   end
   
end