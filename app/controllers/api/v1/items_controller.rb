# frozen_string_literal: true
module Api
  module V1
    class ItemsController < ApplicationController
      def index
        items = Item.all
        render json: items
      end

      def show
        items = Item.find_by(params[:id])
        if items
          render json: items, status: 200
        else
          render json: { error: 'not found' }
        end
      end

      def create
        items = Item.new(item_params)
        if items.save
          render json: items, status: 200
        else
          render json: { error: 'Error creating....' }
        end
      end

      private

      def item_params
        params.require(:item).permit(:item_name, :item_price, :item_quatity, :user_id)
      end
    end
  end
end
