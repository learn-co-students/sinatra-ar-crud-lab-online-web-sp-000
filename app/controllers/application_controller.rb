
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
  end 
  # uses ar to grab all articles and stores them in @articles
  # renders index.erb
  get '/articles' do
    
    @articles = Article.all
    
    erb :index
  end
  # renders the new.erb file 
  get '/articles/new' do 
    #binding.pry 
    
    erb :new
  end 
  # Creates a new article and redirects to /articles/:id'
  post '/articles' do 
    #@article = Article.create(title: params[:title], content: params[:content])
    @article = Article.new
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

    redirect "/articles/#{@article.id}"
  end
  # uses ar to grab the article with id and renders the show.erb
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.save
    erb :show
  end 
  # renders edit.erb
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])

    erb :edit 
  end
  # updates article, redirects to /articles/:id
  patch '/articles/:id' do 
    #binding.pry
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save 

    redirect "/articles/#{@article.id}"
  end 

  delete '/articles/:id' do 
    #binding.pry 
    @article = Article.find(params[:id])
    @article.destroy

    redirect "/articles"
  end 

end
