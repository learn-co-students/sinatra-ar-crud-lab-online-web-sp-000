
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello, World!"
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    new_article = Article.create(params)

    redirect "/articles/#{new_article.id}"
  end

  get '/articles/:id' do
    @new_article = Article.find(params[:id].to_i)

    erb :show
  end

  get '/articles' do
    @all_articles = Article.all

    erb :index
  end

  get '/articles/:id/edit' do
    @edit_article = Article.find(params[:id].to_i)

    erb :edit
  end

  patch '/articles/:id' do
    @edit_article = Article.find(params[:id].to_i)
    @edit_article.update(title: params[:title], content: params[:content])

    redirect "/articles/#{@edit_article.id}"
  end

  delete '/articles/:id' do
    @delete_article = Article.find(params[:id].to_i)
    @delete_article.destroy

    redirect "/articles"
  end
end
