# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = { :practice => "Practice / Craft / Methodology",
      :language => "Language",
      :tools => "Tools / Gadgets",
      :platform => "Platform / Library / API" }

categories.each do |slug, name|
  Category.create! :slug => slug, :name => name
end