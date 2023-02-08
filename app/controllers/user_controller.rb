class UserController < ApplicationController

  def index
    begin
      puts "current_user.name-----#{current_user.name}"
      puts "current_user.name-----#{current_user.user_type}"

      user_id=User.find(current_user.id)
      if user_id.user_type=="seller"
        redirect_to(:controller=> "items",:action =>"index")
      else
        redirect_to(:controller=> "items",:action =>"buyersIndex")
      end
    rescue => exception
      puts "no"
    end
  end

end
