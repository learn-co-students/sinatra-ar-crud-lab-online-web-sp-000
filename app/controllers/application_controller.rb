require 'pry'
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
  #CRUD Read: read all articles

  get '/articles/new' do
    erb :new
  end 
  #CRUD create: create article

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end 
  #CRUD create: create article from form submission

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end 
  #CRUD read: read a specific article
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end 
  #CRUD update: edit a specific article by id

  patch '/articles/:id' do
    @article = Article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end 

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    erb :show
  end 

end


