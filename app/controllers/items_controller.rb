class ItemsController < ApplicationController
  def index
    begin
      @items = Item.all
      @items1 = Item.where(user_id: current_user.id)
      respond_to do |format|
        format.html
        format.csv { send_data @items1.to_csv, filename: "Items-#{Date.today}.csv" }
      end
    rescue
      redirect_to(controller: 'user', action: 'index')
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      ConfirmationsMailer.create_items(current_user.email, current_user.name, @item).deliver
      redirect_to action: 'my_products'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item_arr = []
    @item = Item.find(params[:id])
    item_arr.push(current_user.email, current_user.name, @item.item_name,
                  @item.item_price, @item.id, @item.item_quatity)
    if @item.update(item_params)
      ConfirmationsMailer.update_items(item_arr).deliver
      redirect_to action: 'index'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: 'my_products'
  end

  def my_products
    begin
      @items = Item.where(user_id: current_user.id)
    rescue
      redirect_to(controller: 'user', action: 'index')
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :item_price, :item_quatity, :item_image, :user_id)
  end
end
