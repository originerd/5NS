class AddPictureToNanoposts < ActiveRecord::Migration
  def change
    add_column :nanoposts, :picture, :string
  end
end
