class Category < ActiveRecord::Base
  attr_accessible :name, :slug

  PRACTICE = Category.find_by_slug :practice
  LANGUAGE = Category.find_by_slug :language
  TOOLS    = Category.find_by_slug :tools
  PLATFORM = Category.find_by_slug :platform
end
