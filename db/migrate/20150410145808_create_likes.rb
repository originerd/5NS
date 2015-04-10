class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :nanopost, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :users
    add_foreign_key :likes, :nanoposts
    add_index :likes, [:user_id, :nanopost_id], unique: true
  end
end
