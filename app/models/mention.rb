class Mention < ApplicationRecord

  #==== Association ========================================================
  belongs_to :user, inverse_of: :mentions, dependent: :destroy

  #==== Validations ========================================================
  validates :user, :tweet_id, :text, :tweet_user_id, presence: true
  validates :tweet_id, uniqueness: true

  #==== Reply to Mention ===================================================
  def reply_on_mention(text)
    user.twitter_client.update("@#{tweet_user_name} #{text}", in_reply_to_status_id: tweet_id)
  end
end