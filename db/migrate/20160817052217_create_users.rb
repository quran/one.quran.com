class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid,      null: false
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :link
      t.string :image
      t.string :email
      t.string :name

      t.index :uid
      t.index :provider

      t.timestamps
    end
  end
end
