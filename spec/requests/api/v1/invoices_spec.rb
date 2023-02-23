require 'rails_helper'
require 'factory_bot_rails'
RSpec.describe "Api::V1::Invoices", type: :request do
  describe "Invoice Api" do
    before do
      @item = create(:invoice)
      # get '/api/v1/invoices'
    end
    it 'get/index' do
      byebug
      get '/api/v1/invoices'
      expect(response).to be_successful
    end
    it 'Create Api' do 
      post '/api/v1/invoices', params: {invoice: {item_name: "redmi note 9 pro", item_price: "1200",  item_quatity: "3", date: "20/02/2023", time: "05:10 PM",total_amount: "3600"}}
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(200)
    end  
    it 'Delete Api' do
      delete "/api/v1/invoices/#{@item.id}"
      expect(response).to have_http_status(200)
    end
  end
end



