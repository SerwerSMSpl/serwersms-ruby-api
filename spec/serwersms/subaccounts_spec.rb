require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Subaccounts do
  it 'add' do
    begin
      r = client.subaccounts.add('login', 'haslo', 123, { 'phone' => '500600700' })
      expect(r).to have_key('success')
      expect(r['success']).to be true
    rescue SerwerSMS::Error => e
      skip "[#{e.code}] #{e.message}" if [4500, 4502].include?(e.code)
      fail "[#{e.code}] #{e.message}"
    end
  end

  it 'index' do
    r = client.subaccounts.index
    expect(r).to have_key('items')
  end

  it 'view' do
    begin
      r = client.subaccounts.view(21973)
      expect(r).to have_key('username')
    rescue SerwerSMS::Error => e
      skip "[#{e.code}] #{e.message}"
    end
  end

  it 'limit' do
    begin
      r = client.subaccounts.limit(123, 'eco', 200)
      expect(r).to have_key('success')
      expect(r['success']).to be false
    rescue SerwerSMS::Error => e
      skip "[#{e.code}] #{e.message}"
    end
  end

  it 'delete' do
    begin
      r = client.subaccounts.delete(123)
      expect(r).to have_key('success')
      expect(r['success']).to be false
    rescue SerwerSMS::Error => e
      skip "[#{e.code}] #{e.message}"
    end
  end
end
