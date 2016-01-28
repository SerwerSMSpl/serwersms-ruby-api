class Serwersms::Groups
  def initialize(obj)
      @serwersms = obj
  end
  
  '''
   * Add new group
   * 
   * param string $name
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def add(name)
     params = {}
     params['name']  = name
     @serwersms.call('groups/add',params);
   end
  
   '''
   * List of group
   * 
   * param string $search Group name
   * param array $params
   *      option int "page" The number of the displayed page
   *      option int "limit" Limit items are displayed on the single page
     *      option string "sort" Values: name
     *      option string "order" Values: asc|desc
   * return array
   *      option array "paging"
   *          option int "page" The number of current page
   *          option int "count" The number of all pages
   *      option array "items"
   *          option int "id"
   *          option string "name"
   *          option int "count" Number of contacts in the group
   '''
   def index(search = nil,params = {})

     params['search']     = search
     @serwersms.call('groups/index',params);
   end
  
   '''
   * View single group
   * 
   * param int $id
   * return array
   *      option int "id"
   *      option string "name"
   *      option int "count" Number of contacts in the group
   '''
   def view(id)
     params = {}
     params['id']  = id
     @serwersms.call('groups/view',params);
   end
 
   '''
   * Editing a group
   * 
   * param int $id
   * param string $name
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def edit(id, name)
     params = {}
     params['id']  = id
     params['name']  = name
     @serwersms.call('groups/edit',params);
   end
  
   '''
   * Deleting a group
   * 
   * param int $id
   * return array
   *      option bool "success"
   '''
   def delete(id)
     params = {}
     params['id']  = id
     @serwersms.call('groups/delete',params);
   end
  
   '''
   * Viewing a groups containing phone
   * 
   * param string $phone
   * return array
   *      option int "id"
   *      option int "group_id"
   *      option string "group_name"
   '''
   def check(phone)
     params = {}
     params['phone']  = phone
     @serwersms.call('groups/check',params);
   end
  
end