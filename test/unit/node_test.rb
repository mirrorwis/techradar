require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  def test_should_able_to_create
    node = Node.new :name => "Backbone.js", :content => "123"
    assert node.save
    assert_equal "Backbone.js", node.name
  end

  def test_should_able_to_create_node_with_category
    node = Node.new :name => "Backbone", :category => Category::PLATFORM
    node.save
    node_in_db = Node.find_by_name "Backbone"
    assert node_in_db.category
    assert_equal Category::PLATFORM, node_in_db.category
  end

  def test_setup_association_in_nodes
    parent, child = Node.new, Node.new
    [parent, child].each(&:save)
    parent.nodes << child
    parent.save
    assert_equal 1, parent.nodes.size
  end

  def test_setup_association_in_nodes_and_traverse_reverse
    parent, child = Node.new, Node.new
    [parent, child].each(&:save)
    parent.nodes << child
    parent.save
    assert_equal parent, child.parent_nodes.first
  end

  def test_should_able_to_add_links_to_node
    node = Node.create :name => "Mockito", :category => Category::TOOLS
    node.links << Link.create!(:title => "Mockito", :url => "http://www.mockito.org")

    node.save
    node.reload

    assert_equal 1, node.links.size
    assert_equal "Mockito", node.links.first.title
  end
end
