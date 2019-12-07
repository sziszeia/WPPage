require 'rails_helper'

RSpec.describe AdminController, type: :controller do

    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            post :adminHome , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end
    end

    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            post :updateProduct , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end
    end

    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            post :editProduct , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end
    end

    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            post :deleteProduct , params: {id: 1.to_param}
            expect(response).to redirect_to(home_url)
        end
    end
end
