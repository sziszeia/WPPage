class ShopController < ApplicationController
    def shopHome
        @products = Product.all
        @cart = Cart.find_by(user_id: session[:user_id])
        @cart_items = CartItem.where(cart_id: @cart.id)

        @total = 0

        @cart_items.each do |item|
            prod = Product.find(item.product_id)
            if prod
                @total += prod.price
            end
        end
    end

    def addToCart
        @product = Product.find(params[:id])
        @user = User.find(session[:user_id])
        @cart = Cart.find_by(user_id: @user.id)
        if @product
            @cart_item = CartItem.new(cart_id: @cart.id, product_id: @product.id)

            respond_to do |format|
                if @cart_item.save
                    @product.quantity -= 1
                    @product.save
                    format.html { redirect_to shop_home_url, notice: 'Product was successfully added to cart.' }
                    format.json { render :show, status: :created, location: @product }
                else
                    format.html { render :shopHome }
                    format.json { render json: @cart_item.errors, status: :unprocessable_entity }
                end
            end
        end
    end
end
