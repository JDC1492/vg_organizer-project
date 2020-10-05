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
        post = Post.new(params)
        if post.save
            redirect "/games/#{post.id}"
        else
            redirect "/games/new"
        end

    end



end