class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    categories = { :practice => "Practice / Craft / Methodology",
      :language => "Language",
      :tools => "Tools / Gadgets",
      :platform => "Platform / Library / API" }

    categories.each do |slug, name|
      Category.create! :slug => slug, :name => name
    end
  end
end
