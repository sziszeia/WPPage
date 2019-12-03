class CartController < ApplicationController
    def cartHome
        @user = User.find(session[:user_id])
        @cart = Cart.find_by(user_id: @user.id)
        @cart_items = CartItem.where(cart_id: @cart.id)
    end

    def removeFromCart
        @product = Product.find(params[:id])
        @user = User.find(session[:user_id])
        @cart = Cart.find_by(user_id: @user.id)
        @cart_item = CartItem.find_by(product_id: @product.id, cart_id: @cart.id)
        if @product && @cart && @cart_item
            respond_to do |format|
                if @cart_item.destroy
                    @product.quantity += 1
                    @product.save
                    format.html { redirect_to cart_home_url, notice: 'Item was successfully removed from cart.' }
                    format.json { render :cartHome, status: :deleted }
                else
                    format.html { render :cartHome }
                    format.json { render json: @cart_item.errors, status: :unprocessable_entity }
                end
            end
        end
    end
end
