require 'rails_helper'

RSpec.describe AboutController, type: :controller do
    context 'GET #aboutHome' do 
        it 'returns a success response' do
            get :aboutHome
            expect(response).to be_success
        end
    end
end
