class SessionsController < ApplicationController
   
    get '/login' do
        erb :'/sessions/login'
    end

    get '/signup' do
        @user = Game.new(params)
        erb :'/sessions/sign_up'
    end

    post '/login' do 
        user = User.find_by(email: params[:email])
        # binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/games"
        else  
            redirect "/"
        end
    end

    post '/signup' do 
        redirect "/login"

    end



    get '/logout' do 
        session.clear
        redirect '/login'
    end

end