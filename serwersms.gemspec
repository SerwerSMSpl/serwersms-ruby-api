Gem::Specification.new do |s|
  s.name        = 'serwersms'
  s.version     = '2.0.0'
  s.authors     = ['SerwerSMS']
  s.email       = ['biuro@serwersms.pl']
  s.summary     = 'Klient Ruby do komunikacji zdalnej z API v2 SerwerSMS.pl'
  s.homepage    = 'https://github.com/SerwerSMSpl/serwersms-ruby-api'
  s.license     = 'Apache-2.0'

  s.required_ruby_version = '>= 4.0'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
end
