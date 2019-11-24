class ShopController < ApplicationController
    def shopHome
        @products = Product.all
    end
end
