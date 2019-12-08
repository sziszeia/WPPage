require 'rails_helper'
require './app/helpers/user_helper'

    RSpec.configure do |c|
        c.include UserHelper
    end

RSpec.describe OrderController, type: :controller do
    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            post :orderHome , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :completeOrder , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :confirmation , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :adminComplete , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :adminDispatch , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end
    end

    context "when logged in"do
        before(:each) do
            @testUser = User.create!(id: 1, userName: "testUser", password_digest: "password", userType: "admin")
            @testOrder = Order.create!(id:1, user_id: @testUser.id)
            @testProduct = Product.create!(id: 1, name: "testProduct", description: "This is test product", price:10, quantity:5)
            @testCart = Cart.create!(id: 1, user_id: @testUser.id)
            @testCartItem = CartItem.create!(id: 1, cart_id: @testCart.id, product_id: @testProduct.id)
            log_in(@testUser)
        end

        it 'returns success' do
            users = User.all
            post :orderHome , params: {id: 1.to_param}
            expect(response).to be_success
        end

        it 'returns success' do
            users = User.all
            post :completeOrder , params: {id: 1.to_param}
            expect(response).to redirect_to(order_confirmation_url)
        end

        it 'returns success' do
            users = User.all
            post :confirmation , params: {id: 1.to_param}
            expect(response).to be_success
        end

        it 'returns success' do
            users = User.all
            post :adminComplete , params: {id: 1.to_param}
            expect(response).to redirect_to(admin_home_url)
        end

        it 'returns success' do
            users = User.all
            post :adminDispatch , params: {id: 1.to_param}
            expect(response).to redirect_to(admin_home_url)
        end
    end
end
