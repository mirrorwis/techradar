require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  def test_should_able_to_create
    node = Node.new
    node.content = "123"
    assert node.save
  end

  def test_setup_association_in_nodes
    parent, child = Node.new, Node.new
    [parent, child].each(&:save)
    parent.nodes << child
    parent.save
    assert_equal 1, parent.nodes.size
  end
end
