class Serwersms::Files
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Add new file
   * 
   * param string type - mms|voice
   * param array params
   *      option string "url" URL address to file
   *      option resource "file" A file handler (only for MMS)
   * return array
   *      option bool "success"
   *      option string "id"
   '''
   def add(type, params = {})
     params['type']  = type
     @serwersms.call('files/add',params);
   end
   
   '''
   * List of files
   * 
   * param string type - mms|voice
   * return array
   *      option array "items"
   *          option string "id"
   *          option string "name"
   *          option int "size"
   *          option string "type" - mms|voice
   *          option string "date"
   '''
   def index(type)
     params = {}
     params['type']  = type
     @serwersms.call('files/index',params);
   end
  
   '''
   * View file
   * 
   * param string id
   * param string type - mms|voice
   * return array
   *      option string "id"
   *      option string "name"
   *      option int "size"
   *      option string "type" - mms|voice
   *      option string "date"
   '''
   def view(id,type)
     params = {}
     params['id']    = id
     params['type']  = type
     @serwersms.call('files/view',params);
   end
 
   '''
   * Deleting a file
   * 
   * param string id
   * param string type - mms|voice
   * return array
   *      option bool "success"
   '''
   def delete(id,type)
     params = {}
     params['id']    = id
     params['type']  = type
     @serwersms.call('files/delete',params);
   end
  
end