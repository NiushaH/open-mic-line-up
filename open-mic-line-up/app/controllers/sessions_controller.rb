class SessionsController < ApplicationController

  # routes and views to render login form to user
  get '/login' do
    redirect_if_logged_in
    erb :'users/login'
  end

  # this route's purpose is to receive the login form
  # find the user, and login the user (create a session)
  # Authenticate the user // WHY DOESN'T PARAMS on line 16 USE PASSWORD_DIGEST??
  # Login the user
  # Redirect to the user's landing page
      # if line 18 returns truthy value, login the user and create their session
  # Q&A - why not build a method for begin a session??? and call here as well as for lines 44, 45, & 53??
  #tell user they entered invalid credentials
  post '/login' do
    @user = User.find_by(cellphone: params[:cellphone])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session
      redirect "/users/#{@user.id}"
    else
      flash[:errors] = "Please try your credentials again, perhaps there was a typo."
      redirect '/login'
    end
  end

  # routes and views to allow user to signup for Open Mic World
  # render the signup form, save user credentials in db
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # create new user and persist the new user to the database via params
    # incorporate condition that value user enters != nil and/or custom validator
    if params[:name] != "" && params[:cellphone].match?(/^\d{10}$/) && params[:password] != ""
      # valid input
      @user = User.create(params)
      # login user after signup
      session[:user_id] = @user.id
      puts session
      # runs a new HTTP GET request better than rendering erb template because
      #   separation of concerns -- it's the post route's job to create a new user, that's it (not to show the new user) 
      #   keeps it DRY to use a get request to get to a page,
      #   when you use erb you get access to any instance variable before erb was called
      #   cleaner to requery the database
      # route or controller's action to show you new user is separate from this POST request
      # left @user as an instance variable in case in future want to save what user input into the form and allow user to resubmit after fixing entries
      redirect "/users/#{@user.id}"
    # Stretch Goal: refactor this to use ActiveRecord validations
    else
      # not valid input
      # add message to tell user what is wrong
      flash[:errors] = "Please attempt to create your user account again.  Name must be provided.  Cellphone requires US phone number with 10 consecutive digits, no hyphens.  Password required."
      redirect '/signup'
    end
  end

  # user SHOW route where user registers for performances
  # the dynamic URL identifier gets stored in the params hash key along with the argument passed in as its value
  # redirect_if_not_logged_in
  get '/users/:id' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    access_all_songs
    erb :'/users/show'
  end

  #   post '/users/:id' do
  #     erb :'users/__???__'
  #   end

  # DELETE USER.ID == 6 for practice -- duplicate entry


  get '/logout' do
    # redirect_if_logged_out
    session.clear
    redirect '/'
  end

end
