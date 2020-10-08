class GamesController < ApplicationController

    get '/games' do 
        if logged_in?
        @games = current_user.games
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
       if logged_in?
        @user = current_user
        new_game=Game.new(params)
        if new_game.save 
            @user.games << new_game    #dependent on validations
            redirect "games/#{new_game.id}"
        else
            redirect 'games/new'
        end
        end
    end

    get '/games/:id/edit' do
        @game = Game.find_by_id(params[:id])
        erb :'/games/edit'
    end

    patch '/games/:id' do
        if logged_in?
        @game = Game.find_by_id(params[:id])
        params.delete("_method")
        if @game.update(params)
           @user = current_user
           @user.games << @game     
        end
        redirect "/games/#{@game.id}"
    end
    end


    delete '/games/:id' do
        @game = Game.find_by_id(params[:id])
        @game.destroy
        redirect "/games"
    end

end
