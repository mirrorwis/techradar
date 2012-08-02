class Node < ActiveRecord::Base
  attr_accessible :name, :content, :category, :category_id

  has_and_belongs_to_many :nodes,
                          :class_name => "Node",
                          :join_table => "nodes_nodes",
                          :foreign_key => "from_id",
                          :association_foreign_key => "to_id"

  has_and_belongs_to_many :parent_nodes,
                          :class_name => "Node",
                          :join_table => "nodes_nodes",
                          :foreign_key => "to_id",
                          :association_foreign_key => "from_id"

  belongs_to :category
end
