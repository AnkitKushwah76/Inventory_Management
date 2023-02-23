require 'rails_helper'
require 'factory_bot_rails'
RSpec.describe "Api::V1::Users", type: :request do
  describe "User Api" do
    before do
      @user = create(:user)
      # get '/api/v1/items'
    end
    it 'get/index' do
      get '/api/v1/user'
      expect(response).to be_successful
    end
    it 'get/show' do
      get "/api/v1/user/#{@user.id}"
      expect(response).to be_successful
    end
    it 'Create Api' do 
      post '/api/v1/user', params:{user:{name:@user.name,email:@user.email,password:@user.password}}
      expect(response).to have_http_status(200)
    end 
  end
end
