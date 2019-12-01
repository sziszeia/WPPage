class UserController < ApplicationController
    protect_from_forgery with: :exception
    include UserHelper

    def logIn
        log_in(user_params)
    end

    def register
       @user = User.new
    end

    def createUser
        @user = User.new(user_params)
        @user.userType = 'user'

        respond_to do |format|
            if @user.save

                # If user saved successfully create a cart for them
                @cart = Cart.new(user_id: @user.id)
                @cart.isCompleted = false
                @cart.save!

                log_in(@user)

                format.html { redirect_to home_url, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @user }
              
            else
              format.html { render :register }
              format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    private def user_params
        params.require(:user).permit(:userName, :password_digest)
    end

    def deleteUser
        @deletedUser = User.find(params[:id])
        @cartToDelete = Cart.find(user_id = @deletedUser.id)

        if @deletedUser
            # As cart depends on user any related cart must be deleted before deleting a user
            @cartToDelete.destroy
            @deletedUser.destroy
            respond_to do |format|
              format.html { redirect_to admin_url, notice: 'User was successfully destroyed.' }
              format.json { head :no_content }
            end
        end
    end

    def editUser
        @user = User.find(params[:id])
    end

    def updateUser
        @user = User.find(params[:id])
        
        if @user
            respond_to do |format|
                if @user.update(user_params)
                    format.html { redirect_to admin_url, notice: 'User was successfully updated.' }
                    format.json { render :show, status: :ok, location: @user }
                else
                    format.html { render :editUser }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
            end
        end
      end
end
