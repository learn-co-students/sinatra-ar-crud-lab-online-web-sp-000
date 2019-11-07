require_relative '../models/article.rb'
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

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_article = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_article.update(new_params)

    redirect "/articles/#{id}"
  end

  post '/articles' do
    na = Article.create(params)
    id_na = na.id
    redirect "/articles/#{id_na}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/delete' do
    @article = Article.find(params["id"])
    erb :delete
  end

  delete '/articles/:id' do
    @article = Article.find(params["id"])
    @article.destroy

    redirect '/articles'
  end

end
