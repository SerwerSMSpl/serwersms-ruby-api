class Serwersms::Phones
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Checking phone in to HLR
   * 
   * param string $phone
   * param string $id Query ID returned if the processing takes longer than 60 seconds
   * return array
   *      option string "phone"
   *      option string "status"
   *      option int "imsi"
   *      option string "network"
   *      option bool "ported"
   *      option string "network_ported"
   '''
   def check(phone, id = nil)
     params = {}
     params['id']     = id
     params['phone']  = phone
     @serwersms.call('phones/check',params);
   end
   
   '''
   * Validating phone number
   * 
   * param string $phone
   * return array
   *      option bool "correct"
   '''
   def test(phone)
     params = {}
     params['phone']  = phone
     @serwersms.call('phones/test',params);
   end
   
  
end