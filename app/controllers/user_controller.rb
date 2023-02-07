class UserController < ApplicationController

  def index
  end

  def sellerLogin
  end
 
  def buyerLogin
  end
  
  def buyercreate
  end

  def sellercreate
  end


  def userLogin
    @us=User.find_by(email: params[:user][:email] , password: params[:user][:password])
    if  @us.present?
       if @us.user_type=="seller"
      session[:current_user_id] = @us.id
      session[:current_user_name] = @us.name

      redirect_to(:controller=> "selleruser",:action =>"index")
      else
        puts"no"
       end
    else
      puts "sorry"
    end
    
  end

  def userSignup
    @user=User.new(user_params)
    if @user.save
      redirect_to :action=>"userLogin"
    puts "ok"
  else
    puts "no"
  end
  end


  private 
  def user_params
    params.require(:user).permit(:name,:email,:password,:user_type)
  end
end
