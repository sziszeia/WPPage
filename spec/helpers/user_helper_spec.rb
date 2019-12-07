require 'rails_helper'
require 'spec_helper'
require './app/helpers/user_helper'

RSpec.configure do |c|
    c.include UserHelper
end

RSpec.describe UserHelper do

    it "sets session[:user_id] when log in" do
        userId = 1
        response = log_in(User.new(id: userId))
        expect(session[:user_id]).to eq(1)
    end

    it "returns nil if user does not exist" do
        expect(current_user).to eq(nil)    
    end

    it "deletes session id when logout" do
        log_out

        expect(session[:user_id]).to be(nil)
    end


end