class HomeController < ApplicationController
    include UserHelper
    skip_before_action :logged_in?
    def index
    end
end
