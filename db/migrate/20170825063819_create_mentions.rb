class CreateMentions < ActiveRecord::Migration[5.1]
  def change
    create_table :mentions do |t|
      t.references :user, foreign_key: true
      t.string :tweet_id
      t.string :text
      t.datetime :tweeted_at
      t.string :tweet_user_id
      t.string :tweet_user_name
      t.string :tweet_user_image

      t.timestamps
    end
  end
end
