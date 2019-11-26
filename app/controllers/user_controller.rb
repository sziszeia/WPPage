class UserController < ApplicationController
    def register
       @user = User.new
    end

    def createUser
        @user = User.new(user_params)
        @user.userType = 'user'

        respond_to do |format|
            if @user.save
              format.html { redirect_to home_url, notice: 'Product was successfully created.' }
              format.json { render :show, status: :created, location: @user }
            else
              format.html { render :register }
              format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    private def user_params
        params.require(:user).permit(:userName, :password)
    end

    def deleteUser
        @deletedUser = User.find(params[:id])

        if @deletedUser
            @deletedUser.destroy
            respond_to do |format|
              format.html { redirect_to admin_url, notice: 'Product was successfully destroyed.' }
              format.json { head :no_content }
            end
        end
    end
end
