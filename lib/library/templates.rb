class Serwersms::Templates
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * List of templates
   * param array params
     *      option string "sort" Values: name
     *      option string "order" Values: asc|desc
   * return array
   *      option array "items"
   *          option int "id"
   *          option string "name"
   *          option string "text"
   '''
   def index(params = {} )
     @serwersms.call('templates/index',params);
   end
  
   '''
    Adding new template
   * 
   * param string name
   * param string text
   * return array
   *      option array
   *          option bool "success"
   *          option int "id"
   '''
   def add(name, text)
     params = {}
     params['name']   = name
     params['text']   = text
     @serwersms.call('templates/add',params);
   end
  
   '''
   * Editing a template
   * 
   * param int id
   * param string name
   * param string text
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def edit(id,name, text)
     params = {}
     params['id']       = id
     params['name']     = name
     params['text']     = text
     @serwersms.call('templates/edit',params);
   end
   
   '''
   * Deleting a template
   * 
   * param int id
   * return array
   *      option bool "success"
   '''
   def delete(id)
     params = {}
     params['id'] = id
     @serwersms.call('templates/delete',params);
   end
  
end