class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :content

      t.timestamps
    end
  end
end
