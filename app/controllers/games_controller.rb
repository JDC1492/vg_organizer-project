class GamesController < ApplicationController

    get '/games' do 
        redirect_if_not_logged_in
        @games = current_user.games
        erb :'games/index'
    end

    get '/games/new' do
        redirect_if_not_logged_in
        erb :'games/new'
    end

    get '/games/:id' do 
        redirect_if_not_logged_in
        
        @game = Game.find_by_id(params[:id])
        erb :'games/show'
    end
    
    post '/games' do
       if logged_in?
        @user = current_user
        new_game=Game.new(params)
        if new_game.save #dependent on validations
            @user.games << new_game    
            redirect "games/#{new_game.id}"
        else
            redirect 'games/new'
        end
        end
    end

    get '/games/:id/edit' do
        redirect_if_not_logged_in
        @game = Game.find_by_id(params[:id])
        if @game.user.id == current_user.id
        erb :'/games/edit'
        else
            redirect to "/games"
        end
    end

    patch '/games/:id' do  
        @user = current_user
        @game = Game.find_by_id(params[:id])
        params.delete("_method")
        if @user.id == @game.user.id
            if @game.update(params)   
            # @user.games << @game     
            redirect "/games/#{@game.id}"
            else 
            redirect "/games"
            end    
        end
    end

    delete '/games/:id' do
        @game = Game.find_by_id(params[:id])
        if current_user.id == @game.user.id
        @game.destroy
        end
        redirect "/games"
    end
end
