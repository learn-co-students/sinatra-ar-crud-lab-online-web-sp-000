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
    @article = Article.new
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    Article.create(title: params[:article])
    redirect '/articles'
  end

  get 'alticles/:id/edit' do
    @article = Article.find(params[:id])
    erb :new
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    @article.update(title: params[:article])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy
    erb :delete
  end

end
