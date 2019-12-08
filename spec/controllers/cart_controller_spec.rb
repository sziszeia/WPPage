require 'rails_helper'
require './app/helpers/user_helper'

RSpec.configure do |c|
    c.include UserHelper
end

RSpec.describe CartController, type: :controller do
    

    context "when not logget in" do
        it 'redirects home' do
            get "cartHome"
            expect(response).to redirect_to(home_url)
        end

        it 'redirects home' do
            product = Product.new(name: "Item")
            post :removeFromCart , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end

    end

    context "when logged in" do
        before(:each) do
            @testUser = User.create!(id: 1, userName: "testUser", password_digest: "password")
            log_in(@testUser)
        end
        
        it "has session id set" do
            expect(session[:user_id]).to eq(1)
        end

        it "returns cart home" do
            expect(response).to be_success
        end

        it "removes item from cart" do
            expect(response).to be_success
        end
    end
end
