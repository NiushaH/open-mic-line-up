class PerformancesController < ApplicationController

    get '/performances/performances' do
        if logged_in?
          @performances = Performance.all
          erb :'performances/performances'
        else
          redirect to '/users/login'
        end
    end

    post '/performances/performances' do
        if logged_in?
          if params[:song] == ""
            redirect to "/performances/new"
          else
            @performance = current_user.performances.build(song: params[:song], artist: params[:artist], genre: params[:genre])
            if @performance.save
              redirect to "/performances/#{@performance.id}"
            else
              redirect to "/performances/new"
            end
          end
        else
          redirect to '/users/login'
        end
    end
    

end