require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Files do
  it 'add mms' do
    params = {
      'url'  => 'https://static.serwersms.pl/files/demo.jpg',
      'name' => 'Demo png',
    }
    r = client.files.add('mms', params)
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'add voice' do
    params = {
      'url'  => 'https://static.serwersms.pl/files/demo.wav',
      'name' => 'Demo wav',
    }
    r = client.files.add('voice', params)
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'index mms' do
    r = client.files.index('mms')
    expect(r).to have_key('items')
    skip 'No MMS files available.' if !r['items'].is_a?(Array) || r['items'].count < 1
  end

  it 'index voice' do
    r = client.files.index('voice')
    expect(r).to have_key('items')
    skip 'No Voice files available.' if !r['items'].is_a?(Array) || r['items'].count < 1
  end

  it 'view mms' do
    list = client.files.index('mms')
    expect(list).to have_key('items')
    skip 'No MMS files available.' if list['items'].to_a.empty?
    r = client.files.view(list['items'][0]['id'], 'mms')
    expect(r).to have_key('id')
  end

  it 'view voice' do
    list = client.files.index('voice')
    expect(list).to have_key('items')
    skip 'No Voice files available.' if list['items'].to_a.empty?
    r = client.files.view(list['items'][0]['id'], 'voice')
    expect(r).to have_key('id')
  end

  it 'delete mms' do
    list = client.files.index('mms')
    expect(list).to have_key('items')
    skip 'No MMS files available.' if list['items'].to_a.empty?
    r = client.files.delete(list['items'][0]['id'], 'mms')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'delete voice' do
    list = client.files.index('voice')
    expect(list).to have_key('items')
    skip 'No Voice files available.' if list['items'].to_a.empty?
    r = client.files.delete(list['items'][0]['id'], 'voice')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end
end
