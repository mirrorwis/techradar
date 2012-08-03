class AddTagsToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :tags, :string
  end
end
