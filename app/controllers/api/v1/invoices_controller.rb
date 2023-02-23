class Api::V1::InvoicesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    invoices = Invoice.all
    render json: invoices
  end

  def show
    begin
      invoice=Invoice.find(params[:id])
      render json: invoice, status: 200
      rescue
      render json: { error: 'record not found....' }
    end
  end

  def create
    begin
     invoices = Invoice.new(invoices_params)
     invoices.save
     render json: invoices, status: 200
     rescue
      render json: { error: 'Error creating....' }
    end
  end
  def invoicesSearch
      invoices = Invoice.where('item_name LIKE ?', "%#{params[:invoices][:item_name]}%")
      if invoices.empty?()
        render json: { error: 'record not found....' }
      else
      render json: invoices, status: 200
    end
  end

  def destroy
    begin
      invoice = Invoice.find(params[:id])
      invoice.delete
      render json: invoice, status: 200
      # render json: { message: ' Invoice successfully..'}
      rescue
      render json: { error: 'record not found....' }
    end
  end

  private

  def invoices_params
    params.require(:invoices).permit(:item_quatity, :item_id, :user_id)
  end

end
