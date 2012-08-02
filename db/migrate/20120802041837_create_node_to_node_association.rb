class CreateNodeToNodeAssociation < ActiveRecord::Migration
  def up
    create_table :nodes_nodes, :id => false do |t|
        t.integer :from_id
        t.integer :to_id
    end
    add_index :nodes_nodes, :from_id
    add_index :nodes_nodes, :to_id
  end

  def down
    drop_table :nodes_nodes
  end
end
