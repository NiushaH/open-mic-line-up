class SessionsController < ApplicationController

# routes and views to render login form to user
  get '/users/login' do
    erb :'users/login'
  end

# this route's purpose is to receive the login form
# find the user, and login the user (create a session)
  post 'users/login' do
    # Find the user
    @user = User.find_by(cellphone: => params[:cellphone])
    # Authenticate the user 
    # Login the user
    # Redirect to the user's landing page
    if user && user.authenticate(params[:password])
      # if truthy value, login the user and create their session
      session[:user_id] = user.id
      redirect to "/signups/signups"
    else
      #tell user they entered invalid credentials
      #redirect to login page
            
      redirect to '/users/signup'
    end
  end

# routes and views to allow user to signup
  get 'users/signup' do
    erb :'users/signup'
  end

end