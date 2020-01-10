class AuthController < ApplicationController
    def signin
    end
  
    def verify
        # byebug
        @user = User.find_by(name: params[:auth][:name])
        if @user
            session[:user_id] = @user.id
            redirect_to users_path
        else
            flash[:message] = "Incorrect Info, please try again."
            render :signin
        end
    end
  
    def logout
        session.clear
        redirect_to login_path
    end

    def new
        @user = User.new
    end
    
    def create
        #byebug
        @user = User.new
        @user.name = params[:user][:name]
        @user.age = params[:user][:age]
        @user.gender = params[:user][:gender]
        @user.hp = rand(12..30)
        @user.status = "single"

        @user.save

        redirect_to login_path
    end
  
end
