require_relative '../../config/environment'
require "pry"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  get "/articles/:id" do
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end

  get "/articles/:id/edit" do
    id = params[:id]
    @article = Article.find(id)
    erb :edit
  end


  # POSTS
  post "/articles" do
    @article = Article.create(params)
    redirect "/articles/#{ @article.id }"
  end


 # OTHER
  patch "/articles/:id" do
    id = params[:id]
    art = params[:article]
    #binding.pry
    @article = Article.find(id).update(art)
    redirect "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    #binding.pry
    redirect "/articles"
  end
end