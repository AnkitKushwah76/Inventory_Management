# frozen_string_literal: true
module Api
  module V1
    class UserController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        users = User.all
        render json: users
      end

      def show
        byebug
        user = User.find(params[:id])
        if user
          render json: user, status: 200
        else
          render json: { error: 'not found' }
        end
      end

      def new
        user = User.new
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
        params.require(:user).permit(:ame, :email, :password)
      end
    end
  end
end
