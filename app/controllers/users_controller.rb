class UsersController < ApplicationController

    get '/signup' do
        @user = User.new(params)
        erb :'/users/sign_up'
    end

    post '/signup' do 
        user = User.new(params)
           if user.save && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/games"
        else
        redirect '/signup'
    end
end


end
