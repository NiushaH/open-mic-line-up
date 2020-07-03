class PerformancesController < ApplicationController

  get '/performances' do
    @performances = Performance.all
    erb :'performances/index'
  end    

  # render a form to register a new performance
    get '/performances/new' do
      # if logged_in? == true allow user to add/register new performance
        erb :'performances/new'

      # else ask user to login or signup
      
    end

    # post new song to register a new performance
    post '/performances/new' do
      @performances = Performance.all
      erb :'performances/performances'
    end

    # show route for a performance
    get '/performances/show' do
      erb :'performances/show'
    end

    post '/performances/show' do
    
    end


    # index route for all performances
    get '/performances/performances' do
      if logged_in?
        @performances = Performance.all
        erb :'performances/performances'
      else
        redirect to '/users/login'
      end
    end

    post '/performances/performances' do
      @performances = Performance.all
      if !logged_in?
        redirect to '/users/login'
      else
        # using != because !!"" <-- of an empty string is truthy in Ruby
        if params[:song] != "" || params[:artist] != "" || params[:genre] != ""
          @performance = Performances.build(song: params[:song], artist: params[:artist], genre: params[:genre], user_id: current_user.id)
          if @performance.save
            redirect to "/performances/#{@performance.id}"
          else
            redirect to "/performances/new"
          end
        else
          redirect to "/performances/new"
        end      
      end
    end

    get '/performances/:id' do
      @performance = Performance.find_by(params[:id])
      erb :'performances/show'
    end

  end