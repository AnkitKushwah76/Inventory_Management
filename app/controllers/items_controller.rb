class ItemsController < ApplicationController
  def index
     @items=Item.where(user_id:current_user.id)
  end

  
  def buyersIndex
    @items=Item.all
  end
  def new
    @item=Item.new
  end

  def create
    puts "hello  seller"
    @item=Item.create(item_params)

    if @item.save
      Stock.create(quntity:params[:item][:quntity],item_id:@item.id)
      redirect_to :action =>"index"
    else
      render :new, status: :unprocessable_entity    
    end
  end

  def edit
    @item=Item.find(params[:id])
    @Quantity=Stock.find_by(item_id:@item.id)
    
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      puts "params[:item][:quntity]----#{params[:item][:quntity]}"
      @stock=Stock.find_by(item_id:params[:id])
      @stock.update(quntity:params[:item][:quntity],item_id:@item.id)
      redirect_to action: 'index'
       else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to action: 'index'
    end

  private
  def item_params
    params.require(:item).permit(:itemName,:price,:itemImage,:user_id)
  end
end
