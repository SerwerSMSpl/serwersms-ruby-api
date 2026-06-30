require 'spec_helper'

RSpec.describe SerwerSMS::Resources::Premium do
  it 'index' do
    r = client.premium.index
    expect(r).to have_key('items')
  end

  it 'send' do
    begin
      client.premium.send('500600700', 'Wiadomosc', 71200, 123456)
      fail 'Expected SerwerSMS::Error to be raised'
    rescue SerwerSMS::Error => e
      expect(e.code).to eq(4201)
    end
  end

  it 'quiz' do
    begin
      client.premium.quiz(123)
      fail 'Expected SerwerSMS::Error to be raised'
    rescue SerwerSMS::Error => e
      expect(e.code).to eq(1004)
    end
  end
end
