class AddHotnessToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :hotness, :decimal, :precision => 2, :scale => 2
  end
end
