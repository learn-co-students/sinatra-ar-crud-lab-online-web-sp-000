require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

    erb :index
  end

  get '/index' do
    
    erb :index
  end

  get '/articles' do
    @articles = Article.all
  erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post "/articles" do
    @article = Article.create(params[:article])


    redirect "/articles/#{ @article.id }"
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
  erb :show
  end

  get '/articles/:id/edit' do
  #   a = Article.find(params[:id])
  #  @title = a["title"]
  #  @content = a["content"]
  # a.save
  #  erb :edit
  @article = Article.find_by_id(params[:id])
  # @article.title = params[:title]
  # @article.content = params[:content]
  @article.save
  erb :edit
  # redirect to "/articles/#{@article.id}"
  end

  patch '/articles/:id' do
    # binding.pry
    @article = Article.find_by_id(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save
    # binding.pry
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.delete
    binding.pry
  redirect to '/articles'
  end
end
