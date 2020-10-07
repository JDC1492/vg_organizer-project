class SessionsController < ApplicationController
   
    get '/login' do
        erb :'/sessions/login'
    end

    post '/login' do 
        user = User.find_by(email: params[:email])
        binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/games"
        else  
            redirect "/oops"
        end
    end

end