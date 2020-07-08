class PerformancesController < ApplicationController

  get '/performances' do
    access_all_songs
    erb :'performances/index'
  end    

  get '/performances/index' do
    redirect_if_not_logged_in
    access_all_songs
    erb :'performances/index'
  end    

  # render a form to register a new performance
  get '/performances/new' do
    redirect_if_not_logged_in
    erb :'performances/new'
  end

  # post new song to register a new performance
  post '/performances' do
    redirect_if_not_logged_in
    if params[:song] != "" && params[:artist] != "" && params[:genre] != ""
      @performance = Performance.create(params)
      redirect "/performances/#{@performance.id}"
    else
      redirect '/performances/new'
    end
  end

  # show route for a performance
  get '/performances/:id' do
    set_performance_song
    erb :'performances/show'
  end

  # post '/performances/:id' do
    
  # end

  post '/performances/index' do
    access_all_songs
    redirect_if_not_logged_in
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

  get '/performances/:id/edit' do
    redirect_if_not_logged_in
    access_all_songs
    set_performance_song
    if authorized_to_edit?(@performance)
      erb :'/performances/edit'
    else
      redirect "users/#{current_user.id}"
    end
  end

  patch '/performances/:id' do 
    redirect_if_not_logged_in
    access_all_songs
    set_performance_song
    if params[:song] != "" || params[:artist] != "" || params[:genre] != ""
      if params[:song].empty? == true 
      else params[:song].empty? == false && @performance.user == current_user
        @performance.update(song: params[:song])
      end

      if params[:artist].empty? == true 
      else params[:artist].empty? == false && @performance.user == current_user
        @performance.update(artist: params[:artist])
      end

      if params[:genre].empty? == true 
      else params[:genre].empty? == false && @performance.user == current_user
        @performance.update(genre: params[:genre])
      end
      redirect "/performances/#{@performance.id}"
    else
      redirect "/users/#{current_user.id}"
    end
  end

  delete '/performances/:id' do
    set_performance_song
    if authorized_to_edit?(@performance)
      @performance.destroy
      flash[:message] = "Successfully deleted that entry."
    # need else?
    end
    redirect "/users/#{current_user.id}"
  end

end