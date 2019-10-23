
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
    #binding.pry
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
  #binding.pry
    @article = Article.create(params)

  redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    #binding.pry
    @article = Article.find(params[:id])
    @article.update(params["article"])
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
  end

end
