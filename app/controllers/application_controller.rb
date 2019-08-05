
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  # Show all articles
  get '/articles' do  
    @articles = Article.all

    erb :"index"
  end   

  # Page with form to create new articles
  get '/articles/new' do

    erb :"new"
  end

  # Post request to create new article and redirect to article page
  post '/articles' do
    article = Article.create(params[:article])
    
    redirect to "articles/#{article.id}"
  end
  
  # Display edit article page and form
  get '/articles/:id/edit' do  
    @article = Article.find(params[:id])    
    # binding.pry
    erb :"edit"
  end
  
  # Update article
  patch '/articles/:id' do 
    # binding.pry
    article = Article.find(params[:id])    
    article.update(params[:article])
    
    redirect to "articles/#{article.id}"
  end   

  # Delete article
  delete '/articles/:id' do 
    # binding.pry
    article = Article.find(params[:id])
    article.destroy

    redirect to "/articles"
  end   

  # Display article page
  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :"show"
  end
end
