class AddWallToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :wall, :integer
  end
end
