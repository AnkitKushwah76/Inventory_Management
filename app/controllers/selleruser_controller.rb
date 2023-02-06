class SelleruserController < ApplicationController
  def index
    puts session[:current_user_id]
     @find_items = Item.where(user_id:session[:current_user_id])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
