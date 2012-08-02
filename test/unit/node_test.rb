require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  def test_should_able_to_create
    node = Node.new :name => "Backbone.js", :content => "123"
    assert node.save
    assert_equal "Backbone.js", node.name
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
end
