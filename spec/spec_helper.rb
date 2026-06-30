require 'serwersms'

# Tworzy klienta z zmiennych środowiskowych.
# Zmienne: SERWERSMS_USER + SERWERSMS_PASSWORD lub SERWERSMS_TOKEN

RSpec.shared_context 'serwersms client' do
  let(:client) { SerwerSMS::ClientFactory.from_env }
end

RSpec.configure do |config|
  config.include_context 'serwersms client'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order     = :defined
  config.color     = true
  config.formatter = :documentation
end
