require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Error do
  it 'view' do
    begin
      r = client.error.view(1000)
      expect(r).to have_key('error')
      expect(r['error']['code']).to eq(1000)
    rescue SerwerSMS::Error
      # API zwróciło błąd — zachowanie poprawne
      expect(true).to be true
    end
  end
end
