
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find_by(id: id)
    erb :show
  end

  post '/articles' do
    attributes = params
    @article = Article.create(attributes)

    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    id = params[:id]
    @article = Article.find_by(id: id)
    erb :edit
  end

  patch '/articles/:id' do
    id = params[:id]
    @article = Article.find_by(id: id)
    attributes = params[:article]
    @article.update(attributes)

    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    id = params[:id]
    Article.destroy(id)

    redirect to '/articles'
  end
  
end
