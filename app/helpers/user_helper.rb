module UserHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            begin
                @current_user = User.find(id: session[:user_id])
            rescue => exception
                return
            end
        end
    end

    def logged_in?
        unless User.find_by(id: session[:user_id])
            redirect_to home_url, notice:"Please log in"
        end
    end

    def admin?
        unless User.find_by(id: session[:user_id]).userType == "admin"
            redirect_to home_url, notice:"Restricted area"
        end
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
