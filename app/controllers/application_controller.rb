
require_relative '../../config/environment'
require 'pry'

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
    erb :makeArticle
  end

  post '/articles' do
    newArticle = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{newArticle.id}"
  end

  get '/articles/:id' do
    @chosen = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @chosen = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
      @chosen = Article.find(params[:id])
      @chosen.title = params[:title]
      @chosen.content = params[:content]
      @chosen.save
      redirect to "articles/#{@chosen.id}"
  end

  delete '/articles/:id' do
    @chosen = Article.find(params[:id])
    @chosen.delete
  end

end
