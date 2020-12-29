
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
    @article = Article.find_by_id(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])

    erb :edit
  end

  post '/articles' do
    @article = Article.find_or_create_by(title: params[:title], content: params[:content])

    redirect "/articles/#{@article.id}"
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.update(title: params[:title], content: params[:content])

    erb :show
  end

  delete '/articles/:id' do
    Article.find_by_id(params[:id]).delete

    redirect '/articles'
  end

end
