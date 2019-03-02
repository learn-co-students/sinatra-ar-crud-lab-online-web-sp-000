
require_relative '../../config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  # Get all articles, store in @articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  # Grab article with id, set to @article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # Delete article with id
  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.destroy
    redirect '/articles'
  end

  # Edit article with id
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  patch '/articles/:id' do
    attr_hash = { title: params[:title], content: params[:content] }
    Article.update(params[:id], attr_hash)
    redirect "/articles/#{params[:id]}"
  end
end
