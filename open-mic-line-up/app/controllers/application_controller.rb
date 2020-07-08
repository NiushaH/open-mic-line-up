require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_digest"
  end

  get "/" do
    @performances = Performance.all
    erb :index
  end

  # helper methods
  helpers do 
    def logged_in?
      # true if user is logged in, otherwise false
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(performance)
      performance.user_id == current_user.id
    end

  
    # use this helper method to protect controller actions where user must be logged in to proceed
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end

    # use this helper method to avoid showing login or signup page to a user that's already logged in
    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
    end

    def access_all_songs
      @performances = Performance.all
    end
  
    def set_performance_song
      @performance = Performance.find(params[:id])
    end
  end 
end
