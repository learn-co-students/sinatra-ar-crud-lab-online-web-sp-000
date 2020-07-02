
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @new_article = Article.create(params)
    @new_url = "/articles/#{@new_article[:id]}"
    redirect @new_url
  end

  get '/articles/:id/edit' do
    @edit_article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article_to_edit = Article.find(params[:id])
    @article_to_edit.update(title: params[:title], content: params[:content])
    @new_url = "/articles/#{@article_to_edit.id}"
    redirect @new_url
  end
    
  delete '/articles/:id' do
    @article_to_delete = Article.find(params[:id])
    @article_to_delete.destroy
    erb :index
  end


  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end



end
