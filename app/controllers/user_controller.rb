class UserController < ApplicationController

  def index
    begin
      user_id=User.find(current_user.id)
      if user_id.user_type=="seller"
        redirect_to(:controller=> "items",:action =>"index")
      else

      end
    rescue => exception
      puts "no"
    end
  end

end
