class SelleruserController < ApplicationController
  def index
    puts session[:current_user_id]
     @find_items = Item.where(user_id:session[:current_user_id])
  end

  def show
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.create(item_params)
    if @item.save
      puts "ok"
    else
      puts "no"
    end

  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:itemName,:price)
  end
end
