class CartController < ApplicationController
    def cartHome
        @user = User.find(session[:user_id])
        @cart = Cart.find_by(user_id: @user.id)
        @cart_items = CartItem.where(cart_id: @cart.id)
    end
end
