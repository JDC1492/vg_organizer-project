class GamesController < ApplicationController

    get '/games' do 
        @games = Game.all
        erb :'games/index'
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
        binding.pry
        new_game=Game.new(params)
        if new_game.save
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
        post = Post.new(params)
        if post.save
            redirect "/games/#{post.id}"
        else
            redirect "/games/new"
        end
    end

end