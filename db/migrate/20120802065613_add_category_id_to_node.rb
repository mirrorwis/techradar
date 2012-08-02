class AddCategoryIdToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :category_id, :integer
  end
end
