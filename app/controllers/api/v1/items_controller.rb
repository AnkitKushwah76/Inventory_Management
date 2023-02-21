class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index  
    items = Item.all 
    render json: items.map{ |items| 
    if items.item_image.attached? 
     items.as_json(only: [:id,:item_name,:item_price,:item_quatity,:user_id]).merge(item_image_path:  url_for(items.item_image))
     else 
      items.as_json only: [:id,:item_name,:item_price,:item_quatity,:user_id]
    end
    }
  end

  def show
    begin
      item = Item.find(params[:id])
      if item.item_image.attached? 
       render json: item.as_json(only: [:id,:item_name,:item_price,:item_quatity,:user_id]).merge(item_image_path: url_for(item.item_image))
       else 
        items.as_json only: [:id,:item_name,:item_price,:item_quatity,:user_id]
     end 
      rescue
      render json: { error: 'record not found....' }
    end
  end

  def create
    byebug
    begin
      item = Item.new(item_params)
         item.save
        render json: { message: 'item create successfully..'}
      rescue
        render json: { error: 'error....' }
    end
  end

  def update
    begin
      @item = Item.find(params[:id])
       @item.update(item_params)
        render json: { message: 'item update successfully..'}
      rescue
        render json: { error: 'record not found....' }
    end
  end

  def destroy
    begin
      item = Item.find(params[:id])
      item.delete
      render json: { message: 'item deleted successfully..'}
      rescue
      render json: { error: 'record not found....' }
    end
  end
  private

  def item_params
    params.require(:item).permit(:item_name, :item_price, :item_quatity, :item_image, :user_id)
  end
end
