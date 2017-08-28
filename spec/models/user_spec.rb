require 'rails_helper'

RSpec.describe User, type: :model do
  context 'twitter_id' do
    it 'cannot be nil' do
      User.create(twitter_id: nil, token: 'xyzzzzzzz', token_secret: 'abccccccccccc')
      expect(User.count).to eq(0)
    end

    it 'cannot be duplicate' do
      user1 = User.create(twitter_id: '123456789', token: 'xyzzzzzzz', token_secret: 'abccccccccccc')
      user2 = User.new(twitter_id: '123456789', token: 'xyzzzzzzz', token_secret: 'abccccccccccc')
      expect(user2.valid?).to eq(false)
    end
  end

  context 'token' do
    it 'cannot be nil' do
      User.create(twitter_id: '123456789', token: nil, token_secret: 'abccccccccccc')
      expect(User.count).to eq(0)
    end
  end

  context 'token_secret' do
    it 'cannot be nil' do
      User.create(twitter_id: '123456789', token: 'xyzzzzzzz', token_secret: nil)
      expect(User.count).to eq(0)
    end
  end

end
