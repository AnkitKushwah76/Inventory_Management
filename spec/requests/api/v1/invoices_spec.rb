require 'rails_helper'

RSpec.describe "Api::V1::Invoices", type: :request do

  describe "GET#index" do
    it 'returns all invoices ' do
      # FactoryBot.create(:invoice{item_name: "redmi note 9 pro",item_price: "1200", item_quatity: "3",  date: "20/02/2023",time: "05:10 PM", total_amount: "3600", item_id: 8,  user_id: 4 })
      # get '/api/v1/items'
      # expect(response).to have_http_status(:success)
      # expect(JSON.parse(response.body).size).to eq(1)
    end
  
  end
end
