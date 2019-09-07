
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  post '/articles' do
    new_article = Article.create(title: params[:title], content:params[:content])
    new_article.save
    redirect to("/articles/#{new_article.id}")
  end

  get '/articles/new' do
    erb :new
  end  

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end  

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to('/articles')
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  
  
end
