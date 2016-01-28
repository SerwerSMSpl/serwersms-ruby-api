class Serwersms::Error
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Preview error
   * 
   * param int code
   * return array
   *      option int "code"
   *      option string "type"
   *      option string "message"
   '''
   def view(code)
     @serwersms.call('error/'+code);
   end
  
end