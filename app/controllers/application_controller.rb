
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

  post '/articles/:id' do
    @article = Article.create(title: params[:title], content: params[:content])
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  patch '/articles/:id' do
    @article = Article.update(params[:id], title: params[:title], content: params[:content])
    erb :show
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    @articles = Article.all
    erb :index
  end
end
