
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
  end 

  # CREATE route 
  get '/articles/new' do 
    #form that takes title and content, post to /articles
    erb :new
  end 

  # CREATE article and save to DB 
  post '/articles' do 
    @article = Article.create(params)
    #binding.pry

    redirect "/articles/#{@article.id}"
  end 

  # READ all articles
  get '/articles' do
    @articles = Article.all
    # list all articles 
    erb :index
  end

  # READ article by id 
  get '/articles/:id' do
    @article = Article.find(params[:id])
    # show page displays title and content 
    erb :show
  end

  # UPDATE article by id 
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end 

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end

  # DELETE article by id 
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    @articles = Article.all
    erb :index
  end

end
