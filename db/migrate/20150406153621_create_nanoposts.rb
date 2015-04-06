class CreateNanoposts < ActiveRecord::Migration
  def change
    create_table :nanoposts do |t|
      t.references :user, index: true
      t.string :content

      t.timestamps null: false
    end
    add_foreign_key :nanoposts, :users
    add_index :nanoposts, [:user_id, :created_at]
  end
end
