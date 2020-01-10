class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        cookies[:item_id] = @item.id
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new
        @item.power = params[:item][:power]
        @item.speed = params[:item][:speed]

        @item.save
        redirect_to items_path

    end

    def delete
        @item = Item.find(cookies[:item_id])
        @possessions = Possession.all
        @ownerships = @possessions.select do |possess|
            possess.id == @item.id
        end
        #byebug
        @item.destroy
        @ownerships.each do |possess|
            possess.destroy
        end
        
        redirect_to items_path
    end
end
