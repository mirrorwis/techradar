class AddSlugToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :slug, :string

    add_index :nodes, :slug
  end
end
