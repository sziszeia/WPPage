class ShopController < ApplicationController
    def shopHome
        @products = Product.all
    end

    def addToCart
        @product = Product.find(params[:id])

        if @product
            
        end
    end
end
