
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  set :method_override, true

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

  post '/articles' do
    @article = Article.new(params)
    @article.save

    @articles = Article.all
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  delete '/articles/:id' do
    Article.find(params[:id]).destroy
    redirect '/articles'
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.title = params[:title].strip
    article.content = params[:content].strip
    article.save

    redirect "/articles/#{article.id}"
  end
end
