class GravesController < ApplicationController
    def index
        @graves = Grave.all
        
    end

    def new
        @grave = Grave.new
        @you = User.find(session[:user_id])
        redirect_to '/graves/create'
    end

    def create
        @you = User.find(session[:user_id])
        @grave = Grave.new
        @grave.slayer_id = @you.id
        @grave.user_id = cookies[:target_user]

        @grave.save

        @victim = User.find(cookies[:target_user])
        UsersController.die(@victim)

        redirect_to graves_path
    end
end
