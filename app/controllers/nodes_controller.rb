class NodesController < ApplicationController

  def index
    @nodes = Node.all
  end

  def show
    @node = Node.find(params[:id]) || Node.find_by_name(params[:id]) rescue nil
    unless @node
      @node = Node.new :name => params[:id]
      @categories = Category.all
      flash[:notice] = "#{params[:id]} doesn't exist, so create new one"
      render :action => :new
    end

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

  def edit
    @node  = Node.find(params[:id])
    @categories = Category.all
  end

  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
          format.html { redirect_to(@node, :notice => 'Node was successfully updated.') }
      else
          format.html { render :action => :new }
      end
    end
  end
end