# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ItemsController do
  describe 'GET index' do
    it 'renders a successful response' do
      user = User.create!(name: 'ankit1', email: 'ankit111@gmail.com', password: 'aaaaaaa')
      get :index, params: { id: user.id }
      expect(response.status).to eq(302)
    end
  end
  describe 'GET new' do
    it 'render a successful response' do
      get :new
      expect(response).to be_successful
    end
  end
  describe 'POST create' do
    it 'create a new item' do
      user = User.create!(name: 'ankit1', email: 'ankit111@gmail.com', password: 'aaaaaaa')
      post :create, params: { item: { item_name: 'laptop', item_price: '1200', item_quatity: '12', user_id: user.id } }
      expect(Item.count).to eq(1)
    end
  end
  describe 'PUT update' do
    it 'update the requested item' do
      user = User.create!(name: 'ankit1', email: 'ankit111@gmail.com', password: 'aaaaaaa')
      item = Item.create(item_name: 'laptop', item_price: '1200', item_quatity: '12', user_id: user.id)
      post :update,
           params: { id: item.id,
                     item: { item_name: 'laptopHP', item_price: '1300', item_quatity: '11', user_id: user.id } }
      expect(response.status).to eq(302)
    end
  end
  describe 'DELETE destroy' do
    it 'destroys the requested item' do
      user = User.create!(name: 'ankit1', email: 'ankit111@gmail.com', password: 'aaaaaaa')
      item = Item.create(item_name: 'laptop', item_price: '1200', item_quatity: '12', user_id: user.id)
      delete :destroy,
             params: { id: item.id,
                       item: { item_name: 'laptop', item_price: '1200', item_quatity: '12', user_id: user.id } }
      expect(response.status).to eq(302)
    end
  end
end
