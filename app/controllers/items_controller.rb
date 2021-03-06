class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if filter_params
      @items = Item.where(status: filter_params.to_i)
    elsif cat_params
      @items = Item.where(category: cat_params)
    else
      @items = Item.all
    end
  end

  def new
  end

  def create
    @item = Item.new(name: item_params[:name], category: item_params[:category], user_id: current_user.id)

    if @item.save
      NewItemJob.perform_later(current_user.email)
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def fulfill
    if current_user&.admin?
      @item = Item.find_by(id: params[:id])
      @item.update(:status => 1)
      StatusChangeJob.perform_later(current_user.email, @item)
      redirect_to items_path
    end
  end

  def dismiss
    if current_user&.admin?
      @item = Item.find_by(id: params[:id])
      @item.update(:status => 2)
      StatusChangeJob.perform_later(current_user.email, @item)
      redirect_to items_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
  
  def filter_params
    params[:filter]
  end

  def cat_params
    params[:cat_filter]
  end
end
