
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

  get '/articles/new' do

    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])

    erb :show
  end

  post '/articles' do
    @new_article = Article.new
    @new_article.title = params[:title]
    @new_article.content = params[:content]
    @new_article.save

    redirect "/articles/#{@new_article.id}"
  end

  get '/articles/:id/edit' do
    @post = Article.find_by(id: params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_post = Article.find_by(id: params[:id])
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    new_params[:id] = id
    @post = old_post.update(new_params)

    redirect "/articles/#{id}"
  end

  delete '/articles/:id' do
    post = Article.find_by(id: params["id"])
    post.destroy

    redirect "/articles"
  end


end
