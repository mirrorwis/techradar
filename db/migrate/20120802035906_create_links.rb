class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :title
      t.text :url

      t.timestamps
    end
  end
end
