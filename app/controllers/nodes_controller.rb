class NodesController < ApplicationController

  def show
    @node = Node.find_by_id(params[:id])
  end

  def new
    @node = Node.new
    @categories = Category.all
  end

  def create
    @node = Node.new(params[:node])

    respond_to do |format|
      if @node.save
          format.html { redirect_to(@node, :notice => 'Node was successfully created.') }
      else
          format.html { render :action => :new }
      end
    end

  end
end