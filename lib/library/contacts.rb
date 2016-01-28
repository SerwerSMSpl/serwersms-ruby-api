class Serwersms::Contacts
  def initialize(obj)
      @serwersms = obj
  end
  '''
   * Add new contact
   * 
   * param string group_id
   * param string phone
   * param array params
   *      option string "email"
   *      option string "first_name"
   *      option string "last_name"
   *      option string "company"
   *      option string "tax_id"
   *      option string "address"
   *      option string "city"
   *      option string "description"
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def add(group_id, phone, params = {})
     params['group_id']  = group_id
     params['phone']     = phone
     @serwersms.call('contacts/add',params);
   end
   '''
   * List of contacts
   * 
   * param int group_id
   * param string search
   * param array params
   *      option int "page" The number of the displayed page
   *      option int "limit" Limit items are displayed on the single page
     *      option string "sort" Values: first_name|last_name|phone|company|tax_id|email|address|city|description
     *      option string "order" Values: asc|desc
   * return array
   *      option array "paging"
   *          option int "page" The number of current page
   *          option int "count" The number of all pages
   *      options array "items"
   *          option int "id"
   *          option string "phone"
   *          option string "email"
   *          option string "company"
   *          option string "first_name"
   *          option string "last_name"
   *          option string "tax_id"
   *          option string "address"
   *          option string "city"
   *          option string "description"
   *          option bool "blacklist"
   *          option int "group_id"
   *          option string "group_name"
   '''
   def index(group_id = nil, search = nil , params = {})
     params['group_id']  = group_id
     params['search']    = search
     @serwersms.call('contacts/index',params);
   end
   '''
   * View single contact
   * 
   * param int id
   * return array
   *      option integer "id"
   *      option string "phone"
   *      option string "email"
   *      option string "company"
   *      option string "first_name"
   *      option string "last_name"
   *      option string "tax_id"
   *      option string "address"
   *      option string "city"
   *      option string "description"
   *      option bool "blacklist"
   '''
   def view(id)
     params = {}
     params['id']  = id
     @serwersms.call('contacts/view',params);
   end
   '''
   * Editing a contact
   * 
   * param int id
   * param int|array group_id
   * param string phone
   * param array params
   *      option string "email"
   *      option string "first_name"
   *      option string "last_name"
   *      option string "company"
   *      option string "tax_id"
   *      option string "address"
   *      option string "city"
   *      option string "description"
   * return array
   *      option bool "success"
   *      option int "id"
   '''
   def edit(id, group_id, phone, params = {})
     params['id']  = id
     params['group_id']  = group_id
     params['phone']  = phone
     @serwersms.call('contacts/edit',params);
   end
   '''
   * Deleting a phone from contacts
   * 
   * param int id
   * return array
   *      option bool "success"
   '''
   def delete(id)
     params = {}
     params['id']  = id
     @serwersms.call('contacts/delete',params);
   end
   '''
   * Import contact list
   * 
   * param string group_name
   * param array contact[]
   *      option string "phone"
   *      option string "email"
   *      option string "first_name"
   *      option string "last_name"
   *      option string "company"
   * return array
   *      option bool "success"
   *      option int "id"
   *      option int "correct" Number of contacts imported correctly
   *      option int "failed" Number of errors
   '''
   def import(group_name, contact = {})
     params = {}
     params['group_name']  = group_name
     params['contact']     = contact.to_json
     @serwersms.call('contacts/import',params);
   end
end

require 'json'