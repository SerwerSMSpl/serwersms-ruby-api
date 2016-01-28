class Serwersms::Premium
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * List of received SMS Premium
   * 
   * return array
   *      option array "items"
   *          option int "id"
   *          option string "to_number" Premium number
   *          option string "from_number" Sender phone number
   *          option string "date"
   *          option int "limit" Limitation the number of responses
   *          option string "text" Message
   '''
   def index()
     params = {}
     @serwersms.call('premium/index',params);
   end

   '''
   * Sending replies for received SMS Premium
   * 
   * param string phone
   * param string text Message
   * param string gate Premium number
   * param int $id ID received SMS Premium
   * return array
   *      option bool "success"
   '''
   def send(phone, text, gate, id)
     params = {}
     params['text']   = text
     params['phone']  = phone
     params['gate']   = gate
     params['id']   = id
     @serwersms.call('premium/send',params);
   end
 
   '''
   * View quiz results
   * 
   * param int id
   * return array
   *      option int "id"
   *      option string "name"
   *      option array "items"
   *          option int "id"
   *          option int "count" Number of response
   '''
   def quiz(id)
     params = {}
     params['id']   = id
     @serwersms.call('quiz/view',params);
   end
end