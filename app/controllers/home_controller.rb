class HomeController < ApplicationController
    include UserHelper
    def index
        @userid = session[:user_id]
    end
end
