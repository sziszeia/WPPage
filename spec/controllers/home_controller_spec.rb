require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    context 'GET #index' do 
        it 'returns a success response' do
            get :index
            expect(response).to be_success
        end
    end
end
