class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user, foreign_key: true
      t.string :ayah_key

      t.timestamps
    end
    add_index :bookmarks, :ayah_key
  end
end
