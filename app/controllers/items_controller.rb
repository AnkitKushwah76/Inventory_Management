class ItemsController < ApplicationController
  def index
     @items=Item.where(user_id:current_user.id)
  end


  def new
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
    params.require(:item).permit(:itemName,:price,:itemImage,:user_id)
  end
end
