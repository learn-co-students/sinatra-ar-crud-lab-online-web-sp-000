
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   @articles = Article.all 
  #   erb :index
  # end
  
  get '/articles/new' do 
    erb :new
  end
  
  post '/articles' do 
    article = Article.new(params[:article])
    article.save
    
    redirect '/articles'
  end 
  
  get '/articles/:id' do 
    @article = Article.find_by_id(params[:id])
    erb :show 
  end 
  
  get '/articles/:id/edit' do 
    @article = Article.find_by_id(params[:id])
    
    erb :edit
  end
  
  delete 'article/:id' do 
    @article = Article.find_by_id(params[:id])
    @article.delete 
    redirect '/articles'
  end 
  
  
  
  
  
  
  
  
  
  
  
  
end
