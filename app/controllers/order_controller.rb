class OrderController < ApplicationController
    def orderHome

    end

    def completeOrder
        @user = User.find(session[:user_id])
        @cart = Cart.find_by(user_id: @user.id)
        @cart_items = CartItem.where(cart_id: @cart.id)

        if @cart && @cart_items
            order = Order.new(user_id: @user.id)
            order.isComplete = false
            order.status = "Processing"
            order.save

            @cart_items.each do |cart_item|
                product = Product.find_by(id: cart_item.product_id)
                OrderItem.new(order_id: order.id, product_id: product.id)
                cart_item.destroy
            end

            respond_to do |format|
                if order
                    format.html { redirect_to order_confirmation_url, notice: 'Order completed successfully.' }
                    format.json { render :confirmation, status: :created }
                else
                    format.html { render :cartHome }
                    format.json { render json: order.errors, status: :unprocessable_entity }
                end
            end
        end
    end

    def confirmation
        @user = User.find(session[:user_id])
        @order = Order.find_by(user_id:@user.id)
    end

    def adminComplete
        @order = Order.find(params[:id])
        @order.isComplete = true
        @order.status = "Complete"

        respond_to do |format|
            if @order.save
                format.html { redirect_to admin_home_url, notice: 'Order completed successfully.' }
                format.json { render :orderHome, status: :created }
            else
                format.html { render :orderHome }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end
end
