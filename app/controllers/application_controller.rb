
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
    new_Article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{new_Article.id}"
  end

  get '/articles' do
    @allArticles = Article.all
    erb :index
  end

  get "/articles/:id" do
    @singleArticle = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @singleArticle = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @singleArticle = Article.find(params[:id])
    @singleArticle.update(params[:id],params[:title], params[:content])
    redirect "/articles/#{singleArticle.id}"
  end

  delete "/articles/:id" do
    @singleArticle = Article.find(params[:id])
    @singleArticle.delete
  end

end
