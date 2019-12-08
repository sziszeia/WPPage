require 'rails_helper'
require './app/helpers/user_helper'

RSpec.configure do |c|
    c.include UserHelper
end

RSpec.describe AdminController, type: :controller do

    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            post :adminHome , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :updateProduct , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :editProduct , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            users = User.all
            post :deleteProduct , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end
    end

    context "when logged in"do
    before(:each) do
        @testUser = User.create!(id: 1, userName: "testUser", password_digest: "password", userType: "admin")
        @testProduct = Product.create!(id: 1, name: "testProduct", description: "This is test product", price:10, quantity:5)
        log_in(@testUser)
    end

    it 'returns success' do
        users = User.all
        post :adminHome , params: {id: 1.to_param}
        expect(response).to be_success
    end

    it 'returns success' do
        users = User.all
        post :editProduct , params: {id: 1.to_param}
        expect(response).to be_success
    end

    it 'returns success' do
        users = User.all
        post :deleteProduct , params: {id: 1.to_param}
        expect(response).to be_truthy
    end
end
end
