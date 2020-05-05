
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  # Create
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end
  
  # Read 
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  
  # Update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    attr_hash = { title: params[:title], content: params[:content] }
    Article.update(params[:id], attr_hash)
    redirect "/articles/#{params[:id]}"
  end

  # Delete

  
  
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy
  end
  
  
  
  
  
  
  
end
