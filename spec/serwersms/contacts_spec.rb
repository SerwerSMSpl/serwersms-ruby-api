require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Contacts do
  it 'add' do
    params = {
      'email'      => 'test@mail.com',
      'first_name' => 'John',
      'last_name'  => 'Doe',
      'company'    => 'Hello Word!',
    }
    r = client.contacts.add(123, '500600800', params)
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'index' do
    r = client.contacts.index
    expect(r).to have_key('items')
    expect(r['items']).to be_an(Array)
  end

  it 'view' do
    list = client.contacts.index
    expect(list).to have_key('items')
    skip 'No contacts available.' if list['items'].to_a.empty?
    r = client.contacts.view(list['items'][0]['id'])
    expect(r).to have_key('id')
  end

  it 'edit' do
    list = client.contacts.index
    expect(list).to have_key('items')
    skip 'No contacts available.' if list['items'].to_a.empty?
    params = {
      'email'      => 'test@mail.com',
      'first_name' => 'John',
      'last_name'  => 'Doe',
      'company'    => 'Hello Word!',
    }
    r = client.contacts.edit(list['items'][0]['id'], 123, '500600700', params)
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'delete' do
    list = client.contacts.index
    expect(list).to have_key('items')
    skip 'No contacts available.' if list['items'].to_a.empty?
    r = client.contacts.delete(list['items'][0]['id'])
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'import' do
    contact = [
      { 'phone' => '500600700', 'email' => 'test@mail.com', 'first_name' => 'John', 'last_name' => 'Doe', 'company' => 'Hello Word!' },
      { 'phone' => '500600800', 'email' => 'test@mail.com', 'first_name' => 'John', 'last_name' => 'Doe', 'company' => 'Hello Word!' },
    ]
    g = client.contacts.import('New group', contact)
    expect(g).to have_key('success')
    expect(g).to have_key('id')
    expect(g['id']).to be_a(Integer)
    expect(g['id']).to be > 0

    c = client.contacts.index(g['id'])
    expect(c).to have_key('items')
    expect(c['items']).to be_an(Array)
    expect(c['items'].count).to eq(2)

    d = client.groups.delete(g['id'])
    expect(d).to have_key('success')
    expect(d['success']).to be true
  end
end
