class Api::V1::UserController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    users = User.all
    render json: users
  end
  def show
    user = User.find(params[:id])
    if user
      render json: user, status: 200
    else
      render json: { error: 'not found' }
    end
  end
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: { error: 'Error creating....' }
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
