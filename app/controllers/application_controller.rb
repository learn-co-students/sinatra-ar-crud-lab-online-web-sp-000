
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

    get '/' do
      redirect '/articles'
    end

    get '/articles/new' do
      @article = Article.new
      erb :new

#  redirect '/articles/:id'
  end

  get '/articles' do
    @articles = Article.all
    #binding.pry
    erb :index
  end

  get '/articles/:id' do
    binding.pry
  #  @article = params[:id]
    erb :show
  end

  post '/articles' do
  #binding.pry
    @article = Article.create(params)

  redirect "/articles/#{@article.id}"
  end
  
end
