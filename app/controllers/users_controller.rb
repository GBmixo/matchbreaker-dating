class UsersController < ApplicationController
    before_action :redirect_user
    
    def index
        @users = User.all
        @you = User.find(session[:user_id])
        #@users.delete(@you.id)
        #byebug
    end

    def show
        @user = User.find(params[:id])
        cookies[:target_user] = @user.id
    end

    def edit
    end

    def update
    end

    def self.die(user)
        @user = user
        @user.status = "deceased"
        @user.save
    end
    
end
