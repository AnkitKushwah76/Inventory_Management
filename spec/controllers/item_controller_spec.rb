require 'rails_helper'

RSpec.describe ItemsController do

  describe 'GET index' do
    it 'renders a successful response' do
      user = User.create!(name: 'ankit1',user_type:"seller",email: "ankit111@gmail.com",password:"aaaaaaa")
      # item = Item.create(name: 'a', description: 'abc', price: 1, category_id: category.id)
      get :index, params: { id:user.id}
      expect(response.status).to eq(302)
    end
  end

  describe 'GET index' do

  
    # let(:item){create :item}
    # let(:user){create :user}
    # it "renders the index template" do
    #     byebug  
    #   get :index
      
    #   expect(response).to render_template("index")
    #   # expect(response).to be_successful
    #   # expect(response.status).to eq 200
    # end
      
      

        # it "returns player for a user" do
        #   # byebug 
        #   get :show, params: { id: user.id }  
        #   expect(response.status).to eq 200
        #   end
  end

    
    # describe 'POST create' do
    #       let(:user){create :user1}
    #       it 'create a new user ' do
    #         post :new
    #         # byebug
    #         post :create,params:{user1: {name: user.name,email: user.email,password: user.password}}
    #         # expect(response.status).to eq 200
    #         expect(response.media_type).to eq('text/html')
    #         # expect(response.context_type).to eq 'text/html;charset=utf-8'
    #       end
    #      end
end