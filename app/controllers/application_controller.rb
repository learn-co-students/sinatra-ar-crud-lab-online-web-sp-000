
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    erb :'articles/index'
  end

  get '/articles/new' do
    erb :'articles/new'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :'articles/show'
  end

  post '/articles' do
    Article.create(params)
    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :'articles/edit'
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.title = params[:title]
    article.content = params[:content]
    article.save

    redirect to "/articles/#{article.id}"
  end

  delete '/articles/:id/delete' do
    Article.delete(Article.find(params[:id]))

    redirect to '/articles'
  end
end
