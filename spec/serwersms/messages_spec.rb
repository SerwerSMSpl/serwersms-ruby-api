require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Messages do
  it 'send sms' do
    r = client.messages.send_sms('500600700', 'Test message', 'INFORMACJA', { 'test' => true, 'details' => true })
    expect(r).to have_key('success')
    expect(r['success']).to be true
    expect(r).to have_key('items')
  end

  it 'send personalized' do
    messages = [
      { 'phone' => '500600700', 'text' => 'First message' },
      { 'phone' => '600700800', 'text' => 'Second message' },
    ]
    r = client.messages.send_personalized(messages, 'INFORMACJA', { 'test' => true, 'details' => true })
    expect(r).to have_key('success')
    expect(r['success']).to be true
    expect(r).to have_key('items')
  end

  it 'send voice' do
    r = client.messages.send_voice('500600700', { 'text' => 'Test message', 'test' => true, 'details' => true })
    expect(r).to have_key('success')
    expect(r['success']).to be true
    expect(r).to have_key('items')
  end

  it 'send mms' do
    list = client.files.index('mms')
    expect(list).to have_key('items')
    delete_file_after_testing = nil

    if list['items'].to_a.empty?
      params = {
        'url'  => 'https://static.serwersms.pl/files/demo.jpg',
        'name' => 'Demo jpg',
      }
      added = client.files.add('mms', params)
      expect(added).to have_key('success')

      list = client.files.index('mms')
      expect(list).to have_key('items')
      skip 'File mms was added but now is not available in index.' if list['items'].to_a.empty?

      delete_file_after_testing = added['id']
    end

    begin
      r = client.messages.send_mms('500600700', 'MMS Title', { 'test' => true, 'file_id' => list['items'][0]['id'], 'details' => true })
      expect(r).to have_key('success')
      expect(r['success']).to be true
      expect(r).to have_key('items')
    rescue SerwerSMS::Error => e
      fail "[#{e.code}] #{e.message}"
    ensure
      client.files.delete(delete_file_after_testing, 'mms') if delete_file_after_testing
    end
  end

  it 'view' do
    list = client.messages.reports
    expect(list).to have_key('items')
    skip 'No message reports available.' if list['items'].to_a.empty?
    r = client.messages.view(list['items'][0]['id'])
    expect(r).to have_key('id')
  end

  it 'reports' do
    r = client.messages.reports
    expect(r).to have_key('items')
  end

  it 'delete' do
    list = client.messages.reports
    expect(list).to have_key('items')
    skip 'No message reports available.' if list['items'].to_a.empty?
    r = client.messages.delete(list['items'][0]['id'])
    expect(r).to have_key('success')
    expect(r['success']).to be false
  end

  it 'received' do
    r = client.messages.received('nd')
    expect(r).to have_key('items')
  end
end
