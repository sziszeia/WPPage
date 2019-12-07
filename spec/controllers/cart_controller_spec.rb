require 'rails_helper'
require './app/helpers/user_helper'

RSpec.configure do |c|
    c.include UserHelper
end

RSpec.describe CartController, type: :controller do
    include UserHelper

    context "when not logget in" do
        it 'redirects home' do
            log_in(User.new(id: 1))
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
        
        
    end
end
