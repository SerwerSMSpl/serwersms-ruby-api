require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Templates do
  it 'index' do
    r = client.templates.index
    expect(r).to have_key('items')
  end

  it 'add' do
    r = client.templates.add('New template', 'Message from template')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'edit' do
    list = client.templates.index
    skip 'No SMS template to edit.' if list['items'].empty?
    r = client.templates.edit(list['items'][0]['id'], 'New template', 'Editing message from template')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'delete' do
    list = client.templates.index
    skip 'No SMS template to delete.' if list['items'].empty?
    r = client.templates.delete(list['items'][0]['id'])
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end
end
