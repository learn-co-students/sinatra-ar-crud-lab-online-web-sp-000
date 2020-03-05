
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  post '/articles' do
    Article.create(params.slice("title","content"))
    article_path = "/articles/#{Article.last.id}"
    redirect article_path
  end

  get'/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by id: params[:id]
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by id: params[:id]
    erb :edit
  end

  patch '/articles/:id/patch' do
    @article = Article.find_by id: params[:id]
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by id: params[:id]
    @article.delete
    redirect '/articles'
  end
end
