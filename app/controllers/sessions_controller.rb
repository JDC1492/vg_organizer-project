class SessionController < ApplicationController
   
    get '/login' do
        erb :'/sessions/login'
    end

    post '/login' do 
        binding.pry
    end

end