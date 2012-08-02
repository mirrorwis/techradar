class AddNameToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :name, :text
  end
end
