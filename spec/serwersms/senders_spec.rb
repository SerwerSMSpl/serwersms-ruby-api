require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Senders do
  it 'index' do
    r = client.senders.index({ 'personalized' => true })
    expect(r).to have_key('items')
  end

  it 'add' do
    begin
      r = client.senders.index({ 'personalized' => true })
      expect(r).to have_key('items')
    rescue SerwerSMS::Error => e
      fail "[#{e.code}] #{e.message}"
    end

    filtered = r['items'].select { |item| item['name'] == 'NewSender' }
    skip "Sender 'NewSender' already exists." if filtered.count > 0

    begin
      r = client.senders.add('NewSender')
      expect(r).to have_key('success')
      expect(r['success']).to be true
    rescue SerwerSMS::Error => e
      skip "[#{e.code}] #{e.message}" if [4407].include?(e.code)
      fail "[#{e.code}] #{e.message}"
    end
  end
end
