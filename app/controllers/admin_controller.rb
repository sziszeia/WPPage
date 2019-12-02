class AdminController < ApplicationController
    include UserHelper
    before_action :admin?

    def adminHome
        @users = User.all
        @products = Product.all
    end

    def newProduct
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.isNew = true
        @product.isDiscounted = false


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

    private def product_params
        params.require(:product).permit(:name, :description, :price, :quantity)
    end

    def deleteProduct
        @currentProduct = Product.find(params[:id])

        if @currentProduct
            @currentProduct.destroy
            respond_to do |format|
              format.html { redirect_to action: 'adminHome', notice: 'Product was successfully destroyed.' }
              format.json { head :no_content }
            end
        end
    end

    def editProduct
        @product = Product.find(params[:id])
    end

    def updateProduct
        @product = Product.find(params[:id])

        @product.isNew = false;
        
        if @product
            respond_to do |format|
                if @product.update(product_params)
                    format.html { redirect_to action: 'adminHome', notice: 'Product was successfully updated.' }
                    format.json { render :show, status: :ok, location: @product }
                else
                    format.html { render :editProduct }
                    format.json { render json: @product.errors, status: :unprocessable_entity }
                end
            end
        end
      end
end
