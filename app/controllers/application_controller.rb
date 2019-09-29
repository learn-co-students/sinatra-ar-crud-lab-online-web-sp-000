
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
    @article = Article.create(title: params[:title], content: params[:content])
    @article.save
    
    redirect "/articles/#{@article.id}"
  end
  
  get '/articles/:id' do
    @article_id = params[:id]
    @article = Article.find(@article_id)
    
    erb :show
  end
  
  get '/articles' do 
    @articles = Article.all
    
    erb :index
  end
  
  get '/articles/:id/edit' do 
    @article_id = params[:id]
    @article = Article.find(@article_id)
    erb :edit
  end
  
  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    
    redirect "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do
    @article_id = params[:id]
    @article = Article.find(@article_id)
    @article.delete
    
    redirect '/articles'
  end
  
end
