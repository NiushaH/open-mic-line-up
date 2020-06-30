class SessionsController < ApplicationController

# routes and views to render login form to user
  get '/users/login' do
    erb :login
  end

# routes and views to allow user to signup
  get 'users/signup' do
    erb :signup
  end

end