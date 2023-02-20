# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @user = User.all
    user_id = User.find(current_user.id)
    redirect_to(controller: 'items', action: 'index')
  rescue StandardError
    puts 'sorry'
  end

  def all_Products
    @all_Products = Item.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(controller: 'items', action: 'my_products')
  end
end
