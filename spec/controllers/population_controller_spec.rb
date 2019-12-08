require 'rails_helper'
require './app/helpers/user_helper'

RSpec.configure do |c|
    c.include UserHelper
end

RSpec.describe PopulationController, type: :controller do
    context "when not logged in"do
        it 'redirects home' do
            users = User.all
            get :populationHome 
            expect(response).to redirect_to(home_url)
        end
    end

    context "when logged in"do
        before(:each) do
            @countries = []        
            @indicators = []
            @populations = [] 

            @countries.push(Country.create!(id: 1, countryCode: "GBR"))
            @indicators.push(Indicator.create!(id:1))
            @countries.push(Country.create!(id: 2))
            @indicators.push(Indicator.create!(id:2))
            @populations.push(Population.create!(id:1, countryCode: 1, indicatorCode: 1, countryCode: "GBR"))

            @testUser = User.create!(id: 1, userName: "testUser", password_digest: "password", userType: "admin")
            log_in(@testUser)
        end

        it 'returns success' do
            users = User.all
            post :populationHome , params: {id: 1.to_param}
            expect(response).to be_success
        end
    end
end
