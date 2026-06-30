require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Accounts do
  it 'limits' do
    r = client.accounts.limits
    expect(r).to have_key('items')
    expect(r['items']).not_to be_empty
    expect(r['items'][0]).to have_key('type')
    expect(r['items'][0]['type']).to eq('eco')
  end
end
