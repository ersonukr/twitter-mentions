class User < ApplicationRecord

  #==== Association ========================================================
  has_many :mentions, inverse_of: :user, dependent: :destroy

  #==== Validations ========================================================
  validates :twitter_id, :token, :token_secret, presence: true
  validates :twitter_id, uniqueness: true

  #==== Initialize twitter client ==========================================
  def twitter_client
    yml_config = YAML::load_file(File.join(Rails.root, 'config', 'twitter.yml'))[Rails.env]
    Twitter::REST::Client.new do |config|
      config.consumer_key = yml_config['consumer_key']
      config.consumer_secret = yml_config['consumer_secret']
      config.access_token = token
      config.access_token_secret = token_secret
    end
  end

  #==== Get and populate in database all mentions of User ==================
  def get_mentions
    # If mentions has already fetched before than only fetch recent mentions
    recent_mentions = mentions.present? ? twitter_client.mentions_timeline(since_id: mentions.last.tweet_id) : twitter_client.mentions_timeline
    recent_mentions.collect do |tweet|
      mention = mentions.find_or_create_by(tweet_id: tweet.id)
      mention.assign_attributes({text: tweet.text,
                                 tweeted_at: tweet.created_at,
                                 tweet_user_id: tweet.user.id,
                                 tweet_user_name: tweet.user.screen_name,
                                 tweet_user_image: tweet.user.profile_image_url})
      mention.save
    end
    mentions
  end
end
