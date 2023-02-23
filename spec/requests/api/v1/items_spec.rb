require 'rails_helper'
require 'factory_bot_rails'
RSpec.describe "Api::V1::Items", type: :request do
  describe "Items Api" do
    before do
      @item = create(:item)
      # get '/api/v1/items'
    end
    it 'get/index' do
      get '/api/v1/items'
      expect(response).to be_successful
    end
    it 'Create Api' do 
      byebug
      post '/api/v1/items', params: {item: {item_name: @item.item_name, item_price: @item.item_price, item_quatity: @item.item_quatity}}
      expect(response.status).to eq(200)
      # expect(response).to have_http_status(200)
    end 
    it 'Update Api' do
      put "/api/v1/items/#{@item.id}",params: {item: {item_name: "redmi note 9 pro", item_price: "1200",  item_quatity: "3"}}
      expect(response).to have_http_status(200)
    end
    it 'Delete Api' do
      delete "/api/v1/items/#{@item.id}"
      expect(response).to have_http_status(200)
    end
  end
end
