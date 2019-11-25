class AdminController < ApplicationController
    def adminHome
        @users = User.all
        @products = Product.all
    end
end
