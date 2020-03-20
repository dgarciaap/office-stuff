class ItemsController < ApplicationController
  def index
    if !filter_params.empty?
      @items = Item.where(:status => filter_params)
    else
      @items = Item.all
    end
  end

  def new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def fulfill
    #if current_user && current_user.admin?
      item = Item.find_by(id: params[:id])
      item.update(:status => 'fulfill')
      redirect_to root_path
    #end
  end

  def dismiss
    #if current_user && current_user.admin?
      item = Item.find_by(id: params[:id])
      item.update(:status => 'dismiss')
      redirect_to rooth_path
    #end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
  
  def filter_params
    params[:filter]
  end
end
