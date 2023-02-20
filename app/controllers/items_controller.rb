# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items1 = Item.where(user_id: current_user.id)
    respond_to do |format|
    format.html
    format.csv { send_data @items1.to_csv, filename: "Items-#{Date.today}.csv" }
    end
   rescue StandardError
    redirect_to(controller: 'user', action: 'index')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      CreateJob.set(wait: 5.minutes).perform_later(current_user.email, current_user.name, @item)
      # ConfirmationsMailer.create_items(current_user.email, current_user.name, @item).deliver_later
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
    item_arr.push(current_user.email, current_user.name, @item.item_name, @item.item_price, @item.id,
    @item.item_quatity)
    if @item.update(item_params)
      # ConfirmationsMailer.update_items(item_arr).deliver_later
      CreateJob.perform_now(current_user.email, current_user.name, @item)
      redirect_to action: 'my_products'
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
    a = User.find(1)
    @items = Item.where(user_id: current_user.id)
  rescue StandardError
    redirect_to(controller: 'user', action: 'index')
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_price, :item_quatity, :item_image, :user_id)
  end
end
