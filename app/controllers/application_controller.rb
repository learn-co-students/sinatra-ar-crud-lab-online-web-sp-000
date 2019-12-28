
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    binding.pry
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/show' do
    erb :show
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    #binding.pry
    redirect to('/articles/show')
  end

  # get '/articles/:id' do
  #
  # end


end
