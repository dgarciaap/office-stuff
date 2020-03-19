class ItemsController < ApplicationController
  def index
    case params[:filter]
    when "1"
      @items = Item.where(:status => "Open")
    when "2"
      @items = Item.where(:status => "Fulfill")
    when "3"
      @items = Item.where(:status => "Dismiss")
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
    @item = Item.find_by(params[:id])
  end

  def fulfill
    if current_user && current_user.admin?
      @item = Item.find_by(params[:id])
      @item.update_attributes(:status => 'Fulfill')
    end
  end

  def dismiss
    if current_user && current_user.admin?
      @item = Item.find_by(params[:id])
      @item.update_attributes(:status => 'Dismiss')
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
end
