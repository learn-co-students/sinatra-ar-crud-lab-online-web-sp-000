
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do

    set :public_folder, 'public'
    set :views, 'app/views'

  end

  get '/articles/new' do

    erb :new

  end

  post '/articles' do

    Article.create(title: params[:article][:title], content: params[:article][:content])

    params[:id] = Article.all.last.id

    redirect '/articles/:id'

  end

get '/articles/:id' do

  binding.pry
end



end
