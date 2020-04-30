
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(params)
    #redirect '/articles/#{_.id}'
    redirect '/articles'

  end

  get '/articles' do 
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end

  get '/articles/:id/edit' do 
    @article = Article.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save
    erb :show
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @title = @article.title
    @article.destroy
    erb :deleted
    #erb :deleted 
  end


end
