class SessionsController < ApplicationController

# routes and views to render login form to user
  get '/users/login' do
    # redirect_if_logged_in
    erb :'users/login'
  end

# this route's purpose is to receive the login form
# find the user, and login the user (create a session)
  post '/users/login' do
    # Find the user
    @user = User.find_by(cellphone: params[:cellphone])
    # Authenticate the user 
    # Login the user
    # Redirect to the user's landing page
    if @user.authenticate(params[:password])
      # if truthy value, login the user and create their session
      session[:user_id] = @user.id
      puts session
      redirect "/users/#{@user.id}"
    else
      #tell user they entered invalid credentials
      #redirect to login page
      
      redirect '/users/login'
    end
  end

# routes and views to allow user to signup for Open Mic World
  get '/users/signup' do
    # erb :'users/signup'
  end

# user SHOW route where user signups for performances
  get '/users/:id' do
    "this will be the user show route"
  end

end