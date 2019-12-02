class AboutController < ApplicationController
    include UserHelper
    skip_before_action :logged_in?
    def aboutHome

    end
end
