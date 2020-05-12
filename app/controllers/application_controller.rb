
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  # create
  get '/articles/new' do
    erb :new 
  end 

  # create
  post '/articles' do 
    article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end 

  # read
  get '/articles/:id' do 
    @article = Article.find(params[:id])

    erb :show
  end

  # read
  get '/articles' do 
    @articles = Article.all

    erb :index 
    #  <li><a href=<%="localhost:9393//articles/#{article.id}"%>><%= article.title %></a></li>
  end 

  # update 
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])

    erb :edit
  end

  # update
  patch '/articles/:id' do 
    article = Article.find(params[:id])
    params.delete("_method")
    article.update(params)
    redirect to "/articles/#{params[:id]}"
  end 

  # delete 
  delete '/articles/:id' do 
    Article.destroy(params[:id])
    redirect to '/articles'
  end


end
