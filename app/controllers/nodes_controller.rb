class NodesController < ApplicationController
  def new
    @node = Node.new
    @categories = Category.all
  end
end
