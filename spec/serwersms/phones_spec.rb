require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Phones do
  it 'check' do
    r = client.phones.check('500600700')
    expect(r).to have_key('phone')
  end

  it 'test' do
    r = client.phones.test('500600700')
    expect(r).to have_key('correct')
    expect(r['correct']).to be true
  end
end
