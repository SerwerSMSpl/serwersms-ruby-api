require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Stats do
  it 'index' do
    r = client.stats.index
    expect(r).to have_key('items')
  end
end
