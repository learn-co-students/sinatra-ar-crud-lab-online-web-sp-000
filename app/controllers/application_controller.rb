
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # READ- shows list of all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # CREATE- create a new article(form)
  get '/articles/new' do
    erb :new
  end

  # READ - shows individual article
  get '/articles/:id' do
    
    @article = Article.find(params["id"])

    erb :show
  end

  # CREATE- create a new article(objects)
  post '/articles' do
    article = Article.create(title: params["title"], content: params["content"])  
    redirect to "/articles/#{article.id}"
  end

  # UPDATE - updates specific article
  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end 

  patch '/articles/:id' do
    @article = Article.find(params["id"])
    @article.title = params["title"]
    @article.content = params["content"]
    @article.save

    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    #binding.pry
    @article = Article.find(params["id"])
    @article.destroy

    redirect to '/articles'
  end


end

