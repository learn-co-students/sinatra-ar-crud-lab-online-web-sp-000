require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  get '/articles' do
    @articles = Articles.all
    erb :index
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    @articles = Articles.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get 'alticles/:id/edit' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.delete
    erb :delete
  end

end
