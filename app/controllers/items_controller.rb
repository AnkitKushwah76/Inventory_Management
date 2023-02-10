class ItemsController < ApplicationController

  def index
    begin
      @items=Item.where(user_id:current_user.id)
      respond_to do |format|
        format.html
        format.csv { send_data @items.to_csv, filename: "Items-#{Date.today}.csv" }
      end
    rescue => exception
      redirect_to(:controller=> "user",:action =>"index")
    end
  end

  def show 

  end

  def new
    @item=Item.new
  end

 def create
      @item=Item.new(item_params)
      if @item.save
        ConfirmationsMailer.create_items(current_user.email,current_user.name,@item).deliver
        redirect_to :action =>"index"
      else
        render :new, status: :unprocessable_entity    
      end
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
      item_arr=[]
      @item=Item.find(params[:id])
      item_arr.push(current_user.email,current_user.name,@item.item_name,
      @item.item_price,@item.id,@item.item_quatity)
      if @item.update(item_params)
        ConfirmationsMailer.update_items(item_arr).deliver
          redirect_to action: 'index'
      else
          render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to action: 'index'
  end

  def buyersIndex
    @items=Item.all
  end



  # def cinvoices
  #     item=Item.find(params[:items][:item_id])
  #     price=item.price
  #     quantity= params[:items][:quantity].to_i
  #     total_price=price.to_i*quantity
  #     @invoice=Invoice.create(customer_name:params[:items][:customer_name],
  #      total_price:total_price,item_id:params[:items][:item_id],user_id:current_user.id)
  #       if @invoice
  #         stock=Stock.find_by(item_id:params[:items][:item_id])
  #          upQuantity=(stock.quntity.to_i)-(quantity)
  #          stock.update(quntity:upQuantity)
  #         redirect_to :action =>"buyersIndex"
  #       else
  #      end

  #   end
  
    private
    def item_params
      params.require(:item).permit(:item_name,:item_price,:item_quatity,:item_image,:user_id)
    end
end
