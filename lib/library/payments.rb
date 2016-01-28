class Serwersms::Payments
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * List of payments
   * 
   * return array
   *      option array "items"
   *          option int "id"
   *          option string "number"
   *          option string "state" paid|not_paid
   *          option float "paid"
   *          option float "total"
   *          option string "payment_to"
   *          option string "url"
   '''
   def index()
     params = {}
     @serwersms.call('payments/index',params);
   end
   
   '''
   * View single payment
   * 
   * param int id
   * return array
   *      option int "id"
   *      option string "number"
   *      option string "state" paid|not_paid
   *      option float "paid"
   *      option float "total"
   *      option string "payment_to"
   *      option string "url"
   '''
   def view(id)
     params = {}
     params['id']  = id
     @serwersms.call('payments/view',params);
   end
   
   '''
   * Download invoice as PDF
   * 
   * param int id
   * return resource
   '''
   def invoice(id)
     params = {}
     params['id']  = id
     @serwersms.call('payments/invoice',params);
   end
   
end