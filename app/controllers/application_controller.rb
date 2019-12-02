class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include UserHelper
    before_action :logged_in?
end
