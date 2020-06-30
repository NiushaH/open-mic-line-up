class SessionsController < ApplicationController

# routes and views to render login form to user
  get '/users/login' do
    erb :'users/login'
  end

  post 'users/login' do
    
  end

# routes and views to allow user to signup
  get 'users/signup' do
    erb :'users/signup'
  end

end