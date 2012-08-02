class AddNodeIdToLink < ActiveRecord::Migration
  def change
     add_column :links, :node_id, :integer
  end
end
