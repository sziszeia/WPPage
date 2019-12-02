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

    def logged_in
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
