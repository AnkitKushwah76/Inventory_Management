class UserController < ApplicationController
  def index
    begin
      user_id = User.find(current_user.id)
      redirect_to(controller: 'items', action: 'index')
    rescue
      puts 'sorry'
    end
  end
end
