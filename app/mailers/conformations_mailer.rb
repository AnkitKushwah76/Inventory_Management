class ConformationsMailer < ApplicationMailer

    def create_items(user_email,user_name,item)
        @item=item
        @user_name=user_name
        mail(to:user_email, subject:"Conformations")
      end

    def update_items(item_arr)
       @item_arr=item_arr
        user_email=item_arr[0]
        mail(to:user_email, subject:"Conformations")
      end
end