class PossessionsController < ApplicationController
    def index
        @possessions = Possession.all
        @you = User.find(session[:user_id])
        @your_stuff = @possessions.select do |possess|
            possess.user_id == @you.id
        end
        @your_stuff.each do |thing|
            
        end
        
    end

    def new
        @possession = Possession.new
        @you = User.find(session[:user_id])
        redirect_to '/graves/create'
    end

    def create
        @you = User.find(session[:user_id])
        @possession = Possession.new
        @possession.user_id = cookies[:target_user]
        @possession.item_id = cookies[:item_id]

        @possession.save

        redirect_to possessions_path
    end
end
