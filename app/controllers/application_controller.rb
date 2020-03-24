
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  # +++++ Create +++++

  get '/articles/new' do 
    erb :new 
  end 

  post '/articles' do 
    @new_article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@new_article.id}"
  end 
  
  # +++++ Read +++++
  
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end 

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 

  # +++++ Update +++++

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end 

  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    @article.save 
    erb :show
  end 

  # +++++ Delete +++++

  delete '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.delete
    redirect to '/index'
  end 

end
