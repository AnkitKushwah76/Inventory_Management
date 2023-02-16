# frozen_string_literal: true

class InvoicesController < ApplicationController
  def index; end

  def new
    Invoices.new
  end

  def create
    invoices = Invoice.new(invoices_params)
    if invoices.save
      redirect_to(controller: 'items', action: 'index')
    else
      puts 'sorry'
    end
  end

  def my_orders
    @my_orders = Invoice.where(user_id: current_user.id)
  end

  def destroy_orders
    invoices = Invoice.find(params[:invoices][:invoice_id])
    invoices.destroy
    redirect_to(controller: 'items', action: 'my_products')
  end

  private

  def invoices_params
    params.require(:invoices).permit(:item_name, :item_price, :item_quatity, :item_id, :user_id)
  end
end
