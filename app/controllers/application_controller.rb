require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # new
  get '/articles/new' do
    erb :new
  end
  
  # create
  post '/articles' do
    @article = Article.create(params)

  redirect "/articles/#{@article.id}"
  end
  
  # index
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  # show
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  # update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    erb :show
  end
  
  # destroy
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy
    erb  :delete
  end
end
