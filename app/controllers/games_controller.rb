class GamesController < ApplicationController

    get '/games' do 
        if logged_in?
        @games = Game.all
        erb :'games/index'
        else
            redirect "/login"
        end
    end

    get '/games/new' do
        erb :'games/new'
    end

    get '/games/:id' do 
        # binding.pry
        @game = Game.find_by_id(params[:id])
        erb :'games/show'
    end
    
    post '/games' do
        # binding.pry
        new_game=Game.new(params)
        if new_game.save        #dependent on validations
            redirect "games/#{new_game.id}"
        else
            redirect 'games/new'
        end
    end

    get '/games/:id/edit' do
        @game = Game.find_by_id(params[:id])
        erb :'/games/edit'
    end

    patch '/games/:id' do
        @game = Game.find_by_id(params[:id])
        params.delete("_method")
        if @game.update(params)
            redirect "/games/#{@game.id}"
        else
            redirect "/games/new"
        end
    end

    delete '/games/:id' do
        @game = Game.find_by_id(params[:id])
        @game.destroy
        redirect "/games"
    end

end
