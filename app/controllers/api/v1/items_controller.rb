class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  def index  
      items = Item.all 
      render json: items.map{ |items| 
        if items.item_image.attached? 
        items.as_json(only: [:item_name,:item_price,:item_quatity,:user_id]).merge(
        avatar_path: url_for(items.item_image))
        else 
        items.as_json only: [:item_name,:item_price,:item_quatity,:user_id]
      end
      }
  end
  def show
    begin
      item = Item.find(params[:id])
      if item.item_image.attached? 
        render json: item.as_json(only: [:item_name,:item_price,:item_quatity,:user_id]).merge(
        item_image_path: url_for(item.item_image))
       else 
        items.as_json only: [:item_name,:item_price,:item_quatity,:user_id]
     end 
      rescue
      render json: { error: 'record not found....' }
    end
  end

  def create
    begin
      item = Item.new(item_params)
      item.save
     render json: item, status: 200
     rescue
      render json: { error: 'Error creating....' }
    end
  end
  def destroy
    byebug
    begin
      item = Item.find(params[:id])
      item.destroy
    #  render json: item, status: 200
     rescue
      render json: { error: 'record not found....' }
    end
  end
  private

  def item_params
    params.require(:items).permit(:item_name, :item_price, :item_quatity,:user_id)
  end

end
