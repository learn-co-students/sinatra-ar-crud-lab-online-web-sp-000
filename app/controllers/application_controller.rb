
require_relative '../../config/environment'
require 'pry'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do

    @article = Article.create(params[:article])
    
    @title = params[:article][:title]
    @content = params[:article][:content]

    redirect to '/articles/5'
  end

  get '/articles/:id' do

    @view_article = Article.find(params[:id])

    erb :show
  end

  get '/articles' do

    @all_articles = Article.all

    erb :index
  
  end

  get '/articles/:id/edit' do

    @edit_article = Article.find(params[:id])
    
    erb :edit
  end

  patch '/articles/:id' do
    # id = params[:id]
    # new_params = {}
    @edit_article = Article.find(params[:id])
    @edit_article.title = params[:title]
    @edit_article.content = params[:content] # update the old article info with new article and parameters
    @edit_article.save

    redirect to '/articles'
  end

  delete '/articles/:id/delete' do
    @article_delete = Article.find(params[:id])
    @article_delete.delete

    erb :delete
  end

end
