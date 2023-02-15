# frozen_string_literal: true

class UserController < ApplicationController
  def index
    user_id = User.find(current_user.id)
    redirect_to(controller: 'items', action: 'index')
  rescue StandardError
    puts 'sorry'
  end
end
