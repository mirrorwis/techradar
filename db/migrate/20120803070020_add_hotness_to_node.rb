class AddHotnessToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :hotness, :integer
  end
end
