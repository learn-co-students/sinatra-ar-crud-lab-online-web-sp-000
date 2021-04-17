
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    title = params[:title]
    content = params[:content]
    new_article = Article.create(title: title, content: content)
    redirect "/articles/#{new_article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    current_article = Article.find_by(id: params[:id])
    title = params[:title]
    content = params[:content]
    current_article.update(title: title, content: content)
    redirect "/articles/#{current_article.id}"
  end

  delete '/articles/:id' do
    Article.delete(params[:id])
  end

end
