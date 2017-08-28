class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :twitter_id
      t.string :name
      t.string :nickname
      t.string :image_url
      t.string :token
      t.string :token_secret

      t.timestamps
    end
  end
end
