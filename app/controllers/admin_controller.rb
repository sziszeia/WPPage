class AdminController < ApplicationController
    def adminHome
        @users = User.all
        @products = Product.all
    end

    def newProduct
        @product = Product.new
    end

    def create
        @product = Product.new(post_params)

        respond_to do |format|
            if @product.save
              format.html { redirect_to action: 'adminHome', notice: 'Product was successfully created.' }
              format.json { render :show, status: :created, location: @product }
            else
              format.html { render :newProduct }
              format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    private def post_params
        params.require(:product).permit(:name, :description, :price)
    end
end
