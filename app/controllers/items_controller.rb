class ItemsController < ApplicationController
  def index
    
     @find_items = Item.where(user_id:session[:current_user_id])
  end


  def new
    puts "neww"
    @item=Item.new
  end

  def create
    puts "hello  seller"
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
    params.require(:item).permit(:itemName,:price,:itemImage)
  end
end
