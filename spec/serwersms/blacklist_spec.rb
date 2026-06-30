require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Blacklist do
  it 'add' do
    r = client.blacklist.add('500600720')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'index' do
    r = client.blacklist.index
    expect(r).to have_key('items')
  end

  it 'check' do
    r = client.blacklist.check('500600720')
    expect(r).to have_key('exists')
    expect(r['exists']).to be true
  end

  it 'delete' do
    r = client.blacklist.delete('500600720')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end
end
