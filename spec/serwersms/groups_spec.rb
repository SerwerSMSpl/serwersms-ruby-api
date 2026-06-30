require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Groups do
  it 'add' do
    begin
      r = client.groups.add('test')
    rescue SerwerSMS::Error => e
      skip "API timeout." if e.code == 28
      raise
    end
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'index' do
    begin
      r = client.groups.index
    rescue SerwerSMS::Error => e
      skip "API timeout." if e.code == 28
      raise
    end
    expect(r).to have_key('items')
  end

  it 'view' do
    begin
      list = client.groups.index
    rescue SerwerSMS::Error => e
      skip "API timeout." if e.code == 28
      raise
    end
    skip 'No groups available.' if list['items'].empty?
    r = client.groups.view(list['items'][0]['id'])
    expect(r).to have_key('id')
  end

  it 'edit' do
    begin
      list = client.groups.index
    rescue SerwerSMS::Error => e
      skip "API timeout." if e.code == 28
      raise
    end
    skip 'No groups available.' if list['items'].empty?
    r = client.groups.edit(list['items'][0]['id'], 'New name')
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'delete' do
    begin
      list = client.groups.index
    rescue SerwerSMS::Error => e
      skip "API timeout." if e.code == 28
      raise
    end
    skip 'No groups available.' if list['items'].empty?
    r = client.groups.delete(list['items'][0]['id'])
    expect(r).to have_key('success')
    expect(r['success']).to be true
  end

  it 'check' do
    begin
      r = client.groups.check('600700800')
    rescue SerwerSMS::Error => e
      skip "API timeout." if e.code == 28
      raise
    end
    expect(r).to have_key('items')
  end
end
