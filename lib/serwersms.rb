class Serwersms

  @@api_url = 'http://api2.serwersms.pl/'
  @format   = 'json'
  @@system   = 'client_ruby'
  attr :messages, true
  attr :files, true
  attr :premium, true
  attr :accounts, true
  attr :senders, true
  attr :groups, true
  attr :contacts, true
  attr :phones, true
  attr :subaccounts, true
  attr :blacklist, true
  attr :payments, true
  attr :stats, true
  attr :templates, true
  attr :error, true
  
  def initialize(username, password)
      @username     = username
      @password     = password
      @messages     = Messages.new(self)
      @files        = Files.new(self)
      @premium      = Premium.new(self)
      @accounts     = Accounts.new(self)
      @senders      = Senders.new(self)
      @groups       = Groups.new(self)
      @contacts     = Contacts.new(self)
      @phones       = Phones.new(self)
      @subaccounts  = Subaccounts.new(self)
      @blacklist    = Blacklist.new(self)
      @payments     = Payments.new(self)
      @stats        = Stats.new(self)
      @templates    = Templates.new(self)
      @error        = Error.new(self)
  end
  
  def call(url, params = {})
      uri = URI.parse(@@api_url+url)
      https = Net::HTTP.new(uri.host,uri.port)
      req = Net::HTTP::Post.new(uri.path,{'Content-Type' => 'application/json'})
      params['username'] = @username
      params['password'] = @password
      params['system']   = @@system
      req.body = params.to_json
      res = https.request(req)
      
      return res.body
  end
end

require 'net/http'
require 'net/https'
require 'json'
Dir[File.dirname(__FILE__) + '/library/*.rb'].each {|file| require file }
