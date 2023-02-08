class ItemsController < ApplicationController

  def index
    begin
      @items=Item.where(user_id:current_user.id)
    rescue => exception
      redirect_to(:controller=> "user",:action =>"index")

    end
  end

  def show 

  end


    def cinvoices
      item=Item.find(params[:items][:item_id])
      price=item.price
      quantity= params[:items][:quantity].to_i
      total_price=price.to_i*quantity
      @invoice=Invoice.create(customer_name:params[:items][:customer_name],
       total_price:total_price,item_id:params[:items][:item_id],user_id:current_user.id)
        if @invoice
          stock=Stock.find_by(item_id:params[:items][:item_id])
           upQuantity=(stock.quntity.to_i)-(quantity)
           stock.update(quntity:upQuantity)
          redirect_to :action =>"buyersIndex"
        else
       end

    end
  
      def buyersIndex
        @items=Item.all
      end

        def new
          @item=Item.new
        end

  def create
        puts "hello  seller"
        @item=Item.create(item_params)

        if @item.save
          Stock.create(quntity:params[:item][:quntity],item_id:@item.id)
          redirect_to :action =>"index"
          else
            render :new, status: :unprocessable_entity    
        end
  end

  def edit
    @item=Item.find(params[:id])
    @Quantity=Stock.find_by(item_id:@item.id)
  end

  def update
      @item=Item.find(params[:id])
      if @item.update(item_params)
        @stock=Stock.find_by(item_id:params[:id])
        @stock.update(quntity:params[:item][:quntity],item_id:@item.id)
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

  private
    def item_params
      params.require(:item).permit(:itemName,:price,:itemImage,:user_id)
    end
  end
