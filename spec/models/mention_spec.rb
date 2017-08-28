require 'rails_helper'

RSpec.describe Mention, type: :model do
  context 'tweet_id' do
    it 'cannot be nil' do
      Mention.create(tweet_id: nil, user: User.first, text: 'abccccccccccc', tweet_user_id: '123456789')
      expect(Mention.count).to eq(0)
    end

    it 'cannot be duplicate' do
      mention1 = Mention.create(tweet_id: '987654321', user: User.first, text: 'abccccccccccc', tweet_user_id: '123456789')
      mention2 = Mention.new(tweet_id: '987654321', user: User.first, text: 'abccccccccccc', tweet_user_id: '123456789')
      expect(mention2.valid?).to eq(false)
    end
  end

  context 'user' do
    it 'cannot be nil' do
      Mention.create(tweet_id: '987654321', user: nil, text: 'abccccccccccc', tweet_user_id: '123456789')
      expect(Mention.count).to eq(0)
    end
  end

  context 'text' do
    it 'cannot be nil' do
      Mention.create(tweet_id: '987654321', user: User.first, text: nil, tweet_user_id: '123456789')
      expect(Mention.count).to eq(0)
    end
  end
end
